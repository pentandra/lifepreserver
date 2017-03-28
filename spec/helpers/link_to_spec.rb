require 'helpers/link_to'

RSpec.describe LifePreserver::LinkTo, helper: true do
  describe '#public_link_to' do
    subject { helper.public_link_to(text, target, attributes) }

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

      context 'with global flag' do
        let(:attributes) { { global: true } }

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
      let(:item) { ctx.create_item('content', {}, '/target/') }
      let(:target) { ctx.create_rep(item, '/target.html') }

      it { is_expected.to eql('<a href="/target.html">Text</a>') }
    end

    context 'with item' do
      let(:target) { ctx.create_item('content', {}, '/target/') }

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
      let(:item) { ctx.create_item('content', {}, '/target/') }
      let(:target) { ctx.create_rep(item, nil) }

      it 'raises' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#public_path_to' do
    subject { helper.public_path_to(target, rep, snapshot, global) }
  end
end
