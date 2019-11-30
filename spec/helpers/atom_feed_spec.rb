# frozen_string_literal: true

require 'helpers/atom_feed'

RSpec.describe LifePreserver::Helpers::AtomFeed, helper: true do
  let(:item_attributes) { {} }

  before do
    ctx.create_item('Feed', item_attributes, '/feed')
    ctx.create_rep(ctx.items['/feed'], '/feed.xml')

    ctx.item = ctx.items['/feed']
    ctx.config[:base_url] = base_url
  end

  describe '#feed_url' do
    subject { helper.feed_url }

    context 'without base_url' do
      let(:base_url) { nil }

      it 'raises' do
        expect { subject }.to raise_error(Nanoc::Error)
      end
    end

    context 'with base_url' do
      let(:base_url) { 'http://url.base' }

      context 'with feed_url' do
        let(:item_attributes) do
          { feed_url: 'http://custom.feed.url/feed.rss' }
        end

        it 'returns custom URL' do
          expect(subject).to eql('http://custom.feed.url/feed.rss')
        end
      end

      context 'without feed_url' do
        it 'returns base URL + path' do
          expect(subject).to eql('http://url.base/feed.xml')
        end
      end
    end
  end

  describe '#feed_alternate_url' do
    subject { helper.feed_alternate_url }

    context 'without base_url' do
      let(:base_url) { nil }

      it 'raises' do
        expect { subject }.to raise_error(Nanoc::Error)
      end
    end

    context 'with base_url' do
      let(:base_url) { 'http://url.base' }

      context 'with alternate_url' do
        let(:item_attributes) do
          { alternate_url: '/alternate.html' }
        end

        it 'returns custom URL' do
          expect(subject).to eql('/alternate.html')
        end
      end

      context 'without feed_url' do
        it 'returns base URL + path' do
          expect(subject).to eql('http://url.base/')
        end
      end
    end
  end
end
