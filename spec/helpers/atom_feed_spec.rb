# frozen_string_literal: true

require 'helpers/atom_feed'

RSpec.describe LifePreserver::Helpers::AtomFeed, helper: true do
  before do
    allow(ctx.dependency_tracker).to receive(:enter)
    allow(ctx.dependency_tracker).to receive(:exit)
  end

  describe '#feed_url' do
    subject { helper.feed_url }

    let(:item_attributes) { {} }

    before do
      ctx.create_item('Feed', item_attributes, '/feed')
      ctx.create_rep(ctx.items['/feed'], '/feed.xml')

      ctx.item = ctx.items['/feed']
      ctx.config[:base_url] = base_url
    end

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

  describe '#atom_tag_for' do
    subject { helper.atom_tag_for(ctx.items['/stuff']) }

    let(:item_attributes) { { created_at: '2015-05-19 12:34:56' } }
    let(:item_rep_path) { '/stuff.xml' }
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

    # TODO: handle missing base_dir
    # TODO: handle missing created_at
  end
end
