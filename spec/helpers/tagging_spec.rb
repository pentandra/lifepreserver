# frozen_string_literal: true

require 'helpers/tagging'

RSpec.describe LifePreserver::Helpers::Tagging, helper: true do
  before do
    ctx.create_item('', { kind: 'tag', name: 'One' }, '/t/one')
    ctx.create_item('', { kind: 'tag', name: 'Two' }, '/t/two')
    ctx.create_item('', { kind: 'tag', name: 'Three' }, '/t/three')

    ctx.config[:tags_root] = '/t'
  end

  describe '#tag_set' do
    subject(:tags) { helper.tag_set(items) }

    before do
      ctx.create_item('blah', { kind: 'blogpost', tags: %w[One] }, '/0')
      ctx.create_item('blah blah', { kind: 'blogpost', tags: %w[Two One] }, '/1')
      ctx.create_item('blah blah blah', { kind: 'blogpost' }, '/2')
    end

    context 'with nil items' do
      let(:items) { nil }

      it 'returns two tags' do
        expect(tags).to include('One', 'Two')
      end
    end

    context 'with collection of one item with one tag' do
      let(:items) { ctx.items.find_all('/0') }

      it 'returns one tag' do
        expect(tags).to include('One')
      end
    end

    context 'with collection of one item with no tags' do
      let(:items) { ctx.items.find_all('/2') }

      it 'returns no tags' do
        expect(tags).to be_empty
      end
    end

    context 'with one item with one tag' do
      let(:items) { ctx.items['/0'] }

      it 'returns one tag' do
        expect(tags).to include('One')
      end
    end

    context 'with all items' do
      let(:items) { ctx.items }

      it 'returns two tags' do
        expect(tags).to include('One', 'Two')
      end
    end
  end

  describe '#sorted_tags' do
    subject(:sorted_tags) { helper.sorted_tags }

    context 'with three tags' do
      it 'returns tag items in alphabetical order' do
        expect(sorted_tags).to eq([ctx.items['/t/one'],
                                   ctx.items['/t/three'],
                                   ctx.items['/t/two']])
      end
    end
  end

  describe '#link_for_tag' do
    subject(:link) { helper.link_for_tag(tag, rel_tag: rel_tag, absolute: absolute) }

    let(:rel_tag) { true }
    let(:absolute) { false }

    before do
      ctx.config[:base_url] = 'https://example.site'
    end

    context 'with string tag' do
      let(:tag) { 'One' }

      before do
        ctx.create_rep(ctx.items['/t/one'], '/tags/1.html')
      end

      it 'returns a link to the page about the One tag' do
        expect(link).to eq(%(<a href="/tags/1.html" rel="tag">One</a>))
      end
    end

    context 'with item tag' do
      let(:tag) { ctx.items['/t/two'] }

      before do
        ctx.create_rep(ctx.items['/t/two'], '/tags/2.html')
      end

      it 'returns a link to the page about the Two tag' do
        expect(link).to eq(%(<a href="/tags/2.html" rel="tag">Two</a>))
      end
    end

    context 'with semantic tag' do
      let(:tag) { ctx.items['/t/sem-tag'] }

      before do
        tag_attrs = {
          kind: 'tag',
          name: 'Semantic Tag',
          uri: 'https://example.org/semantic-tag',
        }
        ctx.create_item('', tag_attrs, '/t/sem-tag')
        ctx.create_rep(ctx.items['/t/sem-tag'], '/tags/sem-tag.html')
      end

      context 'without rel_tag' do
        let(:rel_tag) { false }

        it 'returns a simple link' do
          expect(link).to eq(%(<a href="/tags/sem-tag.html">Semantic Tag</a>))
        end
      end

      context 'with rel_tag' do
        let(:rel_tag) { true }

        it 'returns a link with ctag attributes' do
          expect(link).to eq(%(<a href="/tags/sem-tag.html" rel="tag ctag:tagged" resource="#semantic_tag_tag" typeof="ctag:AuthorTag"><link property="ctag:means" resource="https://example.org/semantic-tag" typeof="owl:Thing" /><span property="ctag:label">Semantic Tag</span></a>))
        end
      end

      context 'with absolute path' do
        let(:absolute) { true }
        let(:rel_tag) { false }

        it 'returns a link with absolute path' do
          expect(link).to eq(%(<a href="https://example.site/tags/sem-tag.html">Semantic Tag</a>))
        end
      end
    end

    context 'with non-matching string tag' do
      let(:tag) { 'Four' }

      it 'raises' do
        expect { link }.to raise_error(ArgumentError)
      end
    end
  end
end
