# frozen_string_literal: true

require 'helpers/weblog'

RSpec.describe LifePreserver::Helpers::Weblog, helper: true do
  before do
    allow(ctx.dependency_tracker).to receive(:enter)
    allow(ctx.dependency_tracker).to receive(:exit)
  end

  describe '#syndicated?' do
    subject { helper.syndicated?(item) }
    
    before do
      ctx.config[:posts_root] = '/sub'
    end

    context 'with a markdown item under the posts_root' do
      let(:item) { Nanoc::Core::Item.new('blah blah', {}, '/sub/1.md') }

      it { is_expected.to be(0) }
    end

    context 'with an non-document item under the posts_root' do
      let(:item) { Nanoc::Core::Item.new('blah blah', {}, '/sub/1.jpg') }

      it { is_expected.to be(nil) }
    end

    context 'with an item not under the posts_root' do
      let(:item) { Nanoc::Core::Item.new('blah blah', {}, '/0') }

      it { is_expected.to be(nil) }
    end
  end

  describe '#weblog' do
    subject(:weblog) { helper.weblog(*kinds) }

    let(:kinds) { [:article] }

    before do
      ctx.config[:posts_root] = '/posts'

      ctx.create_item('blah', { kind: 'item' }, '/0.md')
      ctx.create_item('blah blah', { kind: 'article' }, '/posts/1.md')
      ctx.create_item('blah blah blah', { kind: 'article' }, '/posts/2.html')
    end

    context 'when requested kinds is nil' do
      let(:kinds) { nil }

      it 'returns the two articles' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html'])
      end
    end

    context 'when requested kinds is an empty array' do
      let(:kinds) { [] }

      it 'returns the two articles' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html'])
      end
    end

    context 'when multiple kinds are requested' do
      let(:kinds) { [:article, :post] }

      before do
        ctx.create_item('blah blah blah blah', { kind: 'post' }, '/posts/3.md')
      end

      it 'returns the three items' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html', '/posts/3.md'])
      end
    end

    context 'when the article is hidden' do
      before do
        ctx.create_item('blah blah blah blah', { kind: 'article', is_hidden: true }, '/posts/3.md')
      end

      it 'is not returned' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html'])
      end
    end

    context 'when articles are requested and item has no kind' do
      before do
        ctx.create_item('blah blah blah blah', {}, '/posts/3.md')
      end

      it 'is not returned' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html'])
      end
    end

    context 'when requested kinds is nil and item has no kind' do
      let(:kinds) { nil }

      before do
        ctx.create_item('blah blah blah blah', {}, '/posts/3.md')
      end

      it 'is returned' do
        expect(weblog.map(&:identifier)).to match_array(['/posts/1.md', '/posts/2.html', '/posts/3.md'])
      end
    end
  end

  describe '#sorted_weblog' do
    subject(:weblog) { helper.sorted_weblog(*kinds) }

    let(:kinds) { :article }

    before do
      ctx.config[:posts_root] = '/posts'

      attrs = { kind: 'item' }
      ctx.create_item('blah', attrs, '/0.md')

      attrs = { kind: 'article', created_at: (Date.today - 1).to_s }
      ctx.create_item('blah blah', attrs, '/posts/1.erb')

      attrs = { kind: 'article', created_at: (Time.now - 500).to_s }
      ctx.create_item('blah blah blah', attrs, '/posts/2.html')
    end

    context 'when sorted' do
      it 'returns the two articles in descending order' do
        expect(weblog.map(&:identifier)).to eq(['/posts/2.html', '/posts/1.erb'])
      end
    end
  end

  describe '#authors' do
    subject(:authors) { helper.authors(posts) }

    context 'when posts is nil' do
      let(:posts) { nil }

      before do
        ctx.create_item('blah', { author_name: 'a0' }, '/0.md')
        ctx.create_item('blah blah', { author_name: 'a1' }, '/1.md')
        ctx.create_item('blah blah blah', { author_name: 'a2' }, '/2.md')
        ctx.create_item('blah blah blah blah', { author_name: 'a2' }, '/3.md')
      end

      it 'returns post authors' do
        expect(authors).to contain_exactly('a0', 'a1', 'a2')
      end
    end

    context 'when posts are given' do
      let(:posts) do
        [
          Nanoc::Core::Item.new('blah', { author_name: 'a0' }, '/0.md'),
          Nanoc::Core::Item.new('blah blah', { author_name: 'a1' }, '/1.md'),
          Nanoc::Core::Item.new('blah blah blah', { author_name: 'a2' }, '/2.md'),
          Nanoc::Core::Item.new('blah blah blah blah', { author_name: 'a2' }, '/3.md'),
        ]
      end

      it 'returns post authors' do
        expect(authors).to contain_exactly('a0', 'a1', 'a2')
      end
    end

    context 'when items have no author' do
      let(:posts) { [Nanoc::Core::Item.new('blah', {}, '/0.md')] }

      it 'returns no authors' do
        expect(authors).to be_empty
      end
    end

    context 'when item has a blank author' do
      let(:posts) { [Nanoc::Core::Item.new('blah', {author_name: ''}, '/0.md')] }

      it 'returns no authors' do
        expect(authors).to be_empty
      end
    end
  end

  describe '#posts_by_author' do
    subject(:posts_by_author) { helper.posts_by_author(author, posts) }

    context 'when posts is nil' do
      let(:posts) { nil }
      let(:author) { 'a2' }

      before do
        ctx.create_item('blah', { author_name: 'a0' }, '/0.md')
        ctx.create_item('blah blah', { author_name: 'a1' }, '/1.md')
        ctx.create_item('blah blah blah', { author_name: 'a2' }, '/2.md')
        ctx.create_item('blah blah blah blah', { author_name: 'a2' }, '/3.md')
      end

      it 'returns the author’s posts' do
        expect(posts_by_author.map(&:identifier)).to match_array(['/2.md', '/3.md'])
      end
    end

    context 'when posts are given' do
      let(:author) { 'a2' }

      let(:posts) do
        [
          Nanoc::Core::Item.new('blah', { author_name: 'a0' }, '/0.md'),
          Nanoc::Core::Item.new('blah blah', { author_name: 'a1' }, '/1.md'),
          Nanoc::Core::Item.new('blah blah blah', { author_name: 'a2' }, '/2.md'),
          Nanoc::Core::Item.new('blah blah blah blah', { author_name: 'a2' }, '/3.md'),
        ]
      end

      it 'returns the author’s posts' do
        expect(posts_by_author.map(&:identifier)).to match_array(['/2.md', '/3.md'])
      end
    end

  end

  describe '#posts_by_year' do
    subject(:posts_by_year) { helper.posts_by_year(year, posts) }

    context 'when posts is nil and items have string dates' do
      let(:posts) { nil }
      let(:year) { 2020 }

      before do
        ctx.create_item('blah', {}, '/0.md')
        ctx.create_item('blah blah', { published_at: '2019-01-01' }, '/1.erb')
        ctx.create_item('blah blah blah', { published_at: '2020-01-01' }, '/2.html')
        ctx.create_item('blah blah blah blah', { published_at: '2020-07-01' }, '/3.md')
      end

      it 'returns the posts published that year' do
        expect(posts_by_year.map(&:identifier)).to match_array(['/2.html', '/3.md'])
      end
    end

    context 'when posts is nil and items have date objects' do
      let(:posts) { nil }
      let(:year) { 2020 }

      before do
        ctx.create_item('blah', {}, '/0.md')
        ctx.create_item('blah blah', { published_at: Date.parse('2019-01-01') }, '/1.erb')
        ctx.create_item('blah blah blah', { published_at: Date.parse('2020-01-01') }, '/2.html')
        ctx.create_item('blah blah blah blah', { published_at: Date.parse('2020-07-01') }, '/3.md')
      end

      it 'returns the posts published that year' do
        expect(posts_by_year.map(&:identifier)).to match_array(['/2.html', '/3.md'])
      end
    end

    context 'when posts are given' do
      let(:year) { 2020 }

      let(:posts) do
        [
          Nanoc::Core::Item.new('blah', {}, '/0.md'),
          Nanoc::Core::Item.new('blah blah', { published_at: '2019-01-01' }, '/1.erb'),
          Nanoc::Core::Item.new('blah blah blah', { published_at: '2020-01-01' }, '/2.html'),
          Nanoc::Core::Item.new('blah blah blah blah', { published_at: '2020-07-01' }, '/3.md'),
        ]
      end

      it 'returns the posts published that year' do
        expect(posts_by_year.map(&:identifier)).to match_array(['/2.html', '/3.md'])
      end
    end
  end

  describe '#archive_years' do
    subject(:archive_years) { helper.archive_years(posts) }

    context 'when posts is nil' do
      let(:posts) { nil }

      before do
        ctx.create_item('blah', {}, '/0.md')
        ctx.create_item('blah blah', { published_at: '2019-01-01' }, '/1.erb')
        ctx.create_item('blah blah blah', { published_at: '2020-01-01' }, '/2.html')
        ctx.create_item('blah blah blah blah', { published_at: '2020-07-01' }, '/3.md')
      end

      it 'returns the years posts were published' do
        expect(archive_years).to contain_exactly(2019, 2020)
      end
    end
  end

  describe '#post_summary' do
    subject(:post_summary) { helper.post_summary(post, **kwargs) }

    let(:kwargs) { {} }

    let(:post) { ctx.items['/foo.md'] }
    let(:rep) { post.reps.fetch(:default)._unwrap }

    before do
      ctx.create_item('blah', { kind: 'post' }, '/foo.md')
      ctx.create_rep(post, '/foo.html')

      rep.snapshot_defs << Nanoc::Core::SnapshotDef.new(:last, binary: false)
    end

    context 'when item with unseparated content is given' do

      before do
        ctx.compiled_content_store.set(rep, :last, Nanoc::Core::TextualContent.new('Blah'))
      end

      it 'returns body for summary' do
        expect(post_summary).to eq('Blah')
      end
    end

    context 'when item with separated content is given' do
      let(:kwargs) { { separator: '|' } }

      before do
        ctx.compiled_content_store.set(rep, :last, Nanoc::Core::TextualContent.new('Blah|More Blah'))
      end

      it 'returns summary' do
        expect(post_summary).to eq('Blah<p class="readmore"><a class="readmore" title="Read the full post" href="/foo.html">Read more ⇢</a></p>')
      end
    end
  end
end
