# frozen_string_literal: true

require 'helpers/link_to'

RSpec.describe LifePreserver::Helpers::LinkTo, helper: true do
  describe '#link_to_id' do
    subject { helper.link_to_id(target, attributes) }

    let(:base_url) { 'http://url.base' }
    let(:title) { 'Title' }
    let(:target) { raise 'override me' }
    let(:attributes) { {} }

    before do
      ctx.config[:base_url] = base_url

      ctx.create_item('foo', { title: title }, '/target')
      ctx.create_rep(ctx.items['/target'], '/target.html')
    end

    context 'with existing item' do
      let(:target) { '/target' }

      it { is_expected.to eql('<a href="/target.html">Title</a>') }
    end

    context 'with existing item but nil title' do
      let(:target) { '/target' }
      let(:title) { nil }

      it 'raises' do
        expect { subject }.to raise_error(Nanoc::Error)
      end
    end

    context 'with non-existing item' do
      let(:target) { '/non-existing' }

      it 'raises' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#link_to' do
    subject { helper.link_to(text, target, attributes) }

    let(:base_url) { 'http://url.base' }
    let(:text) { 'Text' }
    let(:target) { raise 'override me' }
    let(:attributes) { {} }

    context 'with string path' do
      let(:target) { '/foo/' }

      it { is_expected.to eql('<a href="/foo/">Text</a>') }

      context 'with attributes' do
        let(:attributes) { { title: 'Donkey' } }

        it { is_expected.to eql('<a title="Donkey" href="/foo/">Text</a>') }
      end

      context 'evil HTML markup in text' do
        let(:text) { '</a><script>alert(PWNED!!!)</script>' }

        it { is_expected.to eql('<a href="/foo/">&lt;/a&gt;&lt;script&gt;alert(PWNED!!!)&lt;/script&gt;</a>') }
      end

      context 'special HTML characters in text' do
        let(:text) { 'Foo &amp; Bar' }

        it { is_expected.to eql('<a href="/foo/">Foo &amp; Bar</a>') }
        # Not escaped!
      end

      context 'special HTML characters in href' do
        let(:target) { '/r&d/' }

        it { is_expected.to eql('<a href="/r&amp;d/">Text</a>') }
      end

      context 'special HTML characaters in attributes' do
        let(:attributes) {  { title: 'Research & Development' } }

        it { is_expected.to eql('<a title="Research &amp; Development" href="/foo/">Text</a>') }
      end

      context 'with mailto href' do
        let(:target) { 'mailto:mail@example.org' }
        let(:text) { 'Mail' }

        it { is_expected.to eql('<a href="mailto:mail@example.org">Mail</a>') }
      end
    end

    context 'with rep' do
      before do
        ctx.create_item('content', {}, '/target')
        ctx.create_rep(ctx.items['/target'], '/target.html')
      end

      let(:target) { ctx.items['/target'].reps[:default] }

      it { is_expected.to eql('<a href="/target.html">Text</a>') }
    end

    context 'with item' do
      before do
        ctx.create_item('content', {}, '/target')
        ctx.create_rep(target, '/target.html')
      end

      let(:target) { ctx.items['/target'] }

      it { is_expected.to eql('<a href="/target.html">Text</a>') }
    end

    context 'with nil' do
      let(:target) { nil }

      it 'raises' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'with something else' do
      let(:target) { :donkey }

      it 'raises' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'with non-routed item' do
      before do
        ctx.create_item('content', {}, '/target')
        ctx.create_rep(ctx.items['/target'], nil)
      end

      let(:target) { ctx.items['/target'].reps[:default] }

      it 'raises' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#path_to' do
    subject { helper.path_to(target, attributes) }

    let(:base_url) { 'http://url.base' }
    let(:target) { raise 'override me' }
    let(:attributes) { {} }

    context 'with string target and base url' do
      let(:target) { '/foo/' }

      before do
        ctx.config[:base_url] = base_url
      end

      it { is_expected.to eql('/foo/') }

      context 'with absolute flag' do
        let(:attributes) { { absolute: true } }

        it { is_expected.to eql('http://url.base/foo/') }
      end

      context 'with absolute flag false and matching base url' do
        let(:target) { 'http://url.base/foo/' }
        let(:attributes) { { absolute: false } }

        it { is_expected.to eql('/foo/') }
      end

      context 'without absolute flag but matching base url' do
        let(:target) { 'http://url.base/foo/' }

        it { is_expected.to eql('/foo/') }
      end

      context 'without absolute flag or matching base url' do
        let(:target) { 'http://some.other.base/foo/' }

        it { is_expected.to eql('http://some.other.base/foo/') }
      end
    end

    context 'with current item' do
      before do
        ctx.create_item('content', {}, '/target')
        ctx.create_rep(ctx.items['/target'], '/b/c/target.html')

        ctx.item = ctx.items['/target']
        ctx.item_rep = ctx.item.reps[:default]
      end

      context 'with relative single dot segment indicating the current hierarchical level' do
        let(:target) { '.' }

        it { is_expected.to eql('/b/c/') }
      end

      context 'with relative path indicating another file in the current hierarchical level' do
        let(:target) { './image.png' }

        it { is_expected.to eql('/b/c/image.png') }
      end

      context 'with a bare filename indicating another file in the current hierarchical level' do
        let(:target) { 'image.png' }

        it { is_expected.to eql('/b/c/image.png') }
      end

      context 'with relative path indicating the level above this hierarchical level' do
        let(:target) { '..' }

        it { is_expected.to eql('/b/') }
      end

      context 'with relative path indicating another file in the level above this hierarchical level' do
        let(:target) { '../file2.txt' }

        it { is_expected.to eql('/b/file2.txt') }
      end

      context 'with relative path indicating a level above the root level' do
        let(:target) { '../../../../' }

        it { is_expected.to eql('/') }
      end

      context 'with a string fragment' do
        let(:target) { '#this' }

        it { is_expected.to eql('/b/c/target.html#this') }
      end

      context 'with an attribute fragment' do
        let(:target) { '' }
        let(:attributes) { { fragment: '#this' } }

        it { is_expected.to eql('/b/c/target.html#this') }
      end
    end
  end

  describe '#tag_uri_for' do
    subject { helper.tag_uri_for(ctx.items['/stuff'], fragment: fragment) }

    let(:item_attributes) { { created_at: '2015-05-19 12:34:56' } }
    let(:item_rep_path) { '/stuff.xml' }
    let(:fragment) { nil }
    let(:base_url) { 'http://url.base' }

    before do
      ctx.create_item('Stuff', item_attributes, '/stuff')
      ctx.create_rep(ctx.items['/stuff'], item_rep_path)

      ctx.config[:base_url] = base_url
    end

    context 'item with path' do
      let(:item_rep_path) { '/stuff.xml' }

      it { is_expected.to eql('tag:url.base,2015-05-19:/stuff.xml') }
    end

    context 'item without path' do
      let(:item_rep_path) { nil }

      it 'raises' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end

    context 'base URL without subdir' do
      let(:base_url) { 'http://url.base' }

      it { is_expected.to eql('tag:url.base,2015-05-19:/stuff.xml') }
    end

    context 'base URL with subdir' do
      let(:base_url) { 'http://url.base/sub' }

      it { is_expected.to eql('tag:url.base,2015-05-19:/sub/stuff.xml') }
    end

    context 'created_at is date' do
      let(:item_attributes) do
        { created_at: Date.parse('2015-05-19 12:34:56') }
      end

      it { is_expected.to eql('tag:url.base,2015-05-19:/stuff.xml') }
    end

    context 'created_at is time' do
      let(:item_attributes) do
        { created_at: Time.parse('2015-05-19 12:34:56') }
      end

      it { is_expected.to eql('tag:url.base,2015-05-19:/stuff.xml') }
    end

    context 'missing base_url' do
      let(:base_url) { nil }

      it 'raises' do
        expect { subject }.to raise_error(Nanoc::Error)
      end
    end

    context 'missing created_at' do
      let(:item_attributes) { {} }

      it 'raises' do
        expect { subject }.to raise_error(Nanoc::Error)
      end
    end

    context 'item with path and fragment' do
      let(:item_rep_path) { '/stuff.xml' }
      let(:fragment) { 'this' }

      it { is_expected.to eql('tag:url.base,2015-05-19:/stuff.xml#this') }
    end
  end
end
