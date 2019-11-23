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
end
