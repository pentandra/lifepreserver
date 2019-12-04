# frozen_string_literal: true

require 'helpers/link_to'

RSpec.describe LifePreserver::Helpers::LinkTo, helper: true do
  describe '#link_to' do
    subject { helper.link_to(text, target, attributes) }

    let(:base_url) { 'http://url.base' }
    let(:text) { 'Text' }
    let(:target) { raise 'override me' }
    let(:attributes) { {} }

    before do
      ctx.config[:base_url] = base_url
    end

    context 'with string path' do
      let(:target) { '/foo/' }

      it { is_expected.to eql('<a href="/foo/">Text</a>') }

      context 'with attributes' do
        let(:attributes) { { title: 'Donkey' } }

        it { is_expected.to eql('<a title="Donkey" href="/foo/">Text</a>') }
      end

      context 'with absolute flag' do
        let(:attributes) { { absolute: true } }

        before do
          ctx.config[:base_url] = 'http://url.base'
        end

        it { is_expected.to eql('<a href="http://url.base/foo/">Text</a>') }
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
      end

      let(:target) { ctx.items['/target'] }

      before do
        ctx.create_rep(target, '/target.html')
      end

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

    context 'with nil path' do
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
    subject { helper.path_to(target, rep, snapshot, absolute) }
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
