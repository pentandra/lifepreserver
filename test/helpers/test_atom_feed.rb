# frozen_string_literal: true

require 'helper'

require 'helpers/atom_feed'

module LifePreserver
  module Helpers
    # Adapted from Nanoc's tests for its blogging helper.
    # @see https://github.com/nanoc/nanoc/blob/main/nanoc/test/helpers/test_blogging.rb Nanoc::Helpers::BloggingTest
    class AtomFeedTest < Nanoc::TestCase
      include LifePreserver::Helpers::AtomFeed
      include LifePreserver::Helpers::Text

      def mock_entry
        item = mock
        item.stubs(:[]).with(:updated_at).returns(Time.now - 500)
        item.stubs(:[]).with(:published_at).returns(Time.now - 750)
        item.stubs(:[]).with(:kind).returns('article')
        item.stubs(:[]).with(:created_at).returns(Time.now - 1000)
        item.stubs(:[]).with(:title).returns('An Item')
        item.stubs(:[]).with(:excerpt).returns(nil)
        item.stubs(:fetch).with(:lang).returns(nil)
        item.stubs(:fetch).with(:atom_tag).returns(nil)
        item.stubs(:[]).with(:rights).returns(nil)
        item.stubs(:[]).with(:license).returns(nil)
        item.stubs(:path).returns('/item/')
        item.stubs(:[]).with(:author_name).returns(nil)
        item.stubs(:[]).with(:author_uri).returns(nil)
        item.stubs(:compiled_content).returns('item content')
        item
      end

      def mock_item
        item = mock
        item.stubs(:[]).with(:kind).returns('item')
        item
      end

      def setup
        super

        config = Nanoc::Core::Configuration.new(dir: Dir.getwd).with_defaults

        items = Nanoc::Core::ItemCollection.new(config)
        layouts = Nanoc::Core::LayoutCollection.new(config)
        reps = Nanoc::Core::ItemRepRepo.new

        site =
          Nanoc::Core::Site.new(
            config: config,
            code_snippets: [],
            data_source: Nanoc::Core::InMemoryDataSource.new(items, layouts),
          )

        dep_store = Nanoc::Core::DependencyStore.new(items, layouts, config)
        dependency_tracker = Nanoc::Core::DependencyTracker.new(dep_store)

        compiled_content_cache = Nanoc::Core::CompiledContentCache.new(config: config)
        compiled_content_store = Nanoc::Core::CompiledContentStore.new

        action_provider =
          Class.new(Nanoc::Core::ActionProvider) do
            def self.for(_context)
              raise NotImplementedError
            end

            def initialize; end
          end.new

        compilation_context =
          Nanoc::Core::CompilationContext.new(
            action_provider: action_provider,
            reps: reps,
            site: site,
            compiled_content_cache: compiled_content_cache,
            compiled_content_store: compiled_content_store,
          )

        @view_context = Nanoc::Core::ViewContextForCompilation.new(
          reps: reps,
          items: items,
          dependency_tracker: dependency_tracker,
          compilation_context: compilation_context,
          compiled_content_store: Nanoc::Core::CompiledContentStore.new,
        )
      end

      def test_atom_feed
        # Create items
        @items = [mock, mock_entry, mock_entry]

        # Create item 0
        @items[0].stubs(:[]).with(:kind).returns('item')

        # Create item 1
        @items[1].stubs(:[]).with(:updated_at).returns(Date.today)
        @items[1].stubs(:[]).with(:published_at).returns(Date.today - 1)
        @items[1].stubs(:[]).with(:kind).returns('article')
        @items[1].stubs(:[]).with(:created_at).returns((Date.today - 2).to_s)
        @items[1].stubs(:[]).with(:title).returns('Item One')
        @items[1].stubs(:[]).with(:excerpt).returns(nil)
        @items[1].stubs(:path).returns('/item1/')
        @items[1].expects(:compiled_content).with(snapshot: :pre).returns('item 1 content')

        # Create item 2
        @items[2].expects(:compiled_content).with(snapshot: :pre).returns('item 2 content')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed
      end

      def test_atom_feed_with_times
        # Create items
        @items = [mock_item, mock_entry, mock_entry]

        # Create item 1
        @items[1].stubs(:[]).with(:updated_at).returns(Time.now - 500)
        @items[1].stubs(:[]).with(:created_at).returns(Time.now - 1000)
        @items[1].expects(:compiled_content).returns('item 1 content')

        # Create item 2
        @items[2].stubs(:[]).with(:updated_at).returns(Time.now - 250)
        @items[2].stubs(:[]).with(:created_at).returns(Time.now - 1200)
        @items[2].expects(:compiled_content).returns('item 2 content')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed
      end

      def test_atom_feed_updated_is_most_recent
        # Create items
        @items = [mock_item, mock_entry, mock_entry]

        # Create item 1
        @items[1].stubs(:[]).with(:updated_at).returns(nil)
        @items[1].stubs(:[]).with(:created_at).returns(Time.parse('2016-12-01 17:20:00 +00:00'))
        @items[1].expects(:compiled_content).returns('item 1 content')

        # Create item 2
        @items[2].stubs(:[]).with(:updated_at).returns(nil)
        @items[2].stubs(:[]).with(:created_at).returns(Time.parse('2016-12-01 18:40:00 +00:00'))
        @items[2].expects(:compiled_content).returns('item 2 content')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        assert_match(%r{<title>My Cool Blog</title>\n  <updated>2016-12-01T18:40:00Z</updated>}, atom_feed)
      end

      def test_atom_feed_updated_is_most_recent_updated_at
        # Create items
        @items = [mock_item, mock_entry, mock_entry]

        # Create item 1
        @items[1].stubs(:[]).with(:updated_at).returns(Time.parse('2016-12-01 19:20:00 +00:00'))
        @items[1].stubs(:[]).with(:created_at).returns(Time.parse('2016-12-01 17:20:00 +00:00'))
        @items[1].expects(:compiled_content).returns('item 1 content')

        # Create item 2
        @items[2].stubs(:[]).with(:updated_at).returns(Time.parse('2016-12-01 20:40:00 +00:00'))
        @items[2].stubs(:[]).with(:created_at).returns(Time.parse('2016-12-01 18:40:00 +00:00'))
        @items[2].expects(:compiled_content).returns('item 2 content')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        assert_match(%r{<title>My Cool Blog</title>\n  <updated>2016-12-01T20:40:00Z</updated>}, atom_feed)
      end

      def test_atom_feed_without_entries
        # Mock items
        @items = [mock_item, mock_item]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: no entries',
          error.message,
        )
      end

      def test_atom_feed_without_base_url
        # Create items
        @items = [mock_item, mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: nil }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: site configuration has no base_url',
          error.message,
        )
      end

      def test_atom_feed_without_title
        # Create items
        @items = [mock_item, mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns(nil)
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: no title in params, item or site config',
          error.message,
        )
      end

      def test_atom_feed_without_author_name
        # Create items
        @items = [mock_item, mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns(nil)
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: no author_name in params, item or site config',
          error.message,
        )
      end

      def test_atom_feed_with_author_name_and_uri_from_content_item
        # Create items
        @items = [mock_entry]

        # Create item 1
        @items[0].stubs(:[]).with(:author_name).returns('Don Alias')
        @items[0].stubs(:[]).with(:author_uri).returns('http://don.example.com/')
        @items[0].expects(:compiled_content).returns('item 1 content')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com/' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:kind).returns(nil)
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        # TODO: Use xpath matchers for more specific test
        result = atom_feed
        # Still should keep feed level author
        assert_includes(result, '<name>Denis Defreyne</name>')
        assert_includes(result, '<uri>http://stoneship.org/</uri>')

        # Overrides on specific items
        assert_includes(result, '<name>Don Alias</name>')
        assert_includes(result, '<uri>http://don.example.com/</uri>')
      end

      def test_atom_feed_without_author_uri
        # Create items
        @items = [mock_item, mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns(nil)

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: no author_uri in params, item or site config',
          error.message,
        )
      end

      def test_atom_feed_without_entries_created_at
        # Create items
        @items = [mock_item, mock_entry, mock_entry]
        @items[1].stubs(:[]).with(:created_at).returns(Time.now.to_s)
        @items[2].stubs(:[]).with(:created_at).returns(nil)

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')

        # Check
        error = assert_raises(Nanoc::Core::TrivialError) do
          atom_feed
        end
        assert_equal(
          'Cannot build Atom feed: one or more entries lack created_at',
          error.message,
        )
      end

      def test_atom_feed_with_title_author_name_and_uri_as_params
        # Create items
        @items = [mock_item, mock_entry]
        @items[1].expects(:compiled_content).with(snapshot: :pre).returns('asdf')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns(nil)
        @item.stubs(:[]).with(:author_name).returns(nil)
        @item.stubs(:[]).with(:author_uri).returns(nil)
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed(
          author_name: 'Bob',
          author_uri: 'http://example.com/~bob/',
          title: 'My Blog Or Something',
        )
      end

      def test_atom_feed_with_title_author_name_and_uri_from_config
        # Create items
        @items = [mock_item, mock_entry]
        @items[1].expects(:compiled_content).with(snapshot: :pre).returns('asdf')

        # Mock site
        config_hash =
          {
            author_name: 'Bob',
            author_uri: 'http://example.com/~bob/',
            title: 'My Blog Or Something',
            base_url: 'http://example.com',
          }
        config = Nanoc::Core::Configuration.new(hash: config_hash, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns(nil)
        @item.stubs(:[]).with(:author_name).returns(nil)
        @item.stubs(:[]).with(:author_uri).returns(nil)
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed
      end

      def test_atom_feed_with_entries_param
        # Mock items
        @items = [mock_entry, mock_entry]

        @items[0].expects(:compiled_content).never
        @items[1].stubs(:[]).with(:title).returns('Item One')
        @items[1].expects(:compiled_content).with(snapshot: :pre).returns('asdf')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed entries: [@items[1]]
      end

      def test_atom_feed_with_limit_param
        # Mock entries
        @items = [mock_entry, mock_entry]
        @items.each_with_index do |entry, i|
          entry.stubs(:[]).with(:title).returns("Article #{i}")
          entry.stubs(:[]).with(:published_at).returns(Time.now - i)
        end

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed limit: 1
        assert_match(
          Regexp.new('Article 0', Regexp::MULTILINE),
          result,
        )
        refute_match(
          Regexp.new('Article 1', Regexp::MULTILINE),
          result,
        )
      end

      def test_atom_feed_sorting
        # Mock entries
        @items = [mock_entry, mock_entry]
        @items.each_with_index do |entry, i|
          entry.stubs(:[]).with(:title).returns("Article #{i}")
        end
        @items[0].stubs(:[]).with(:created_at).returns('23-02-2009')
        @items[1].stubs(:[]).with(:created_at).returns('22-03-2009')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed
        assert_match(
          Regexp.new('Article 1.*Article 0', Regexp::MULTILINE),
          result,
        )
      end

      def test_atom_feed_preserve_order
        # Mock entries
        @items = [mock_entry, mock_entry]
        @items.each_with_index do |entry, i|
          entry.stubs(:[]).with(:title).returns("Article #{i}")
        end
        @items[0].stubs(:[]).with(:created_at).returns('01-01-2015')
        @items[1].stubs(:[]).with(:created_at).returns('01-01-2014')

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(preserve_order: true)
        assert_match(
          Regexp.new('Article 1.*Article 0', Regexp::MULTILINE),
          result,
        )
      end

      def test_atom_feed_with_content_proc_param
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(content_proc: ->(_a) { 'foobar!' })
        assert_match 'foobar!</content>', result
      end

      def test_atom_feed_with_excerpt_proc_param
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(excerpt_proc: ->(_a) { 'foobar!' })
        assert_match 'foobar!</summary>', result
      end

      def test_atom_feed_with_title_proc_param
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(title_proc: ->(_a) { 'foobar!' })
        assert_match 'foobar!</title>', result
      end

      def test_atom_feed_with_icon_param
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(icon: 'http://example.com/icon.png')
        assert_match '<icon>http://example.com/icon.png</icon>', result
      end

      def test_atom_feed_with_logo_param
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        result = atom_feed(logo: 'http://example.com/logo.png')
        assert_match '<logo>http://example.com/logo.png</logo>', result
      end

      def test_atom_feed_with_xml_base
        # Mock entry
        @items = [mock_entry]

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:[]).with(:title).returns('My Blog Or Something')
        @item.stubs(:[]).with(:author_name).returns('J. Doe')
        @item.stubs(:[]).with(:author_uri).returns('http://example.com/~jdoe')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns('http://example.com/feed')
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        @items.each { |i| puts i.inspect }
        result = atom_feed
        assert_match 'xml:base="http://example.com/"', result
      end

      def test_atom_feed_with_item_without_path
        # Create items
        @items = [mock_entry]
        @items[0].stubs(:path).returns(nil)

        # Mock site
        config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
        @config = Nanoc::Core::ConfigView.new(config, @view_context)

        # Create feed item
        @item = mock
        @item.stubs(:identifier).returns('/feed/')
        @item.stubs(:[]).with(:title).returns('My Cool Blog')
        @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
        @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
        @item.stubs(:[]).with(:created_at).returns(Time.now)
        @item.stubs(:[]).with(:feed_url).returns(nil)
        @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
        @item.stubs(:path).returns('/journal/feed/')

        # Check
        atom_feed
      end

      def test_atom_feed_without_id
        if_have 'nokogiri' do
          # Create items
          @items = [mock_entry]
          @items[0].stubs(:path).returns(nil)

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns('2022-01-22')
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed)
          id_elements = doc.xpath('/atom:feed/atom:id', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, id_elements.size
          assert_equal 'tag:example.com,2022-01-22:/journal/feed/', id_elements[0].inner_text
        end
      end

      def test_atom_feed_with_id
        if_have 'nokogiri' do
          # Create items
          @items = [mock_entry]
          @items[0].stubs(:path).returns(nil)

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns(Time.now)
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns('http://stoneship.org/index.html')
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed(id: 'tag:foo,bar'))
          id_elements = doc.xpath('/atom:feed/atom:id', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, id_elements.size
          assert_equal 'tag:foo,bar', id_elements[0].inner_text
        end
      end

      def test_atom_feed_without_alternate_url
        if_have 'nokogiri' do
          # Create items
          @items = [mock_item, mock_entry]

          @items[0].stubs(:path).returns('/journal/feed')

          @items[1].stubs(:path).returns(nil)

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns(Time.now)
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns(nil)
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed)
          elements = doc.xpath('/atom:feed/atom:link[@rel=\'alternate\']', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, elements.size
          assert_equal 'http://example.com/journal/', elements[0].attribute('href').inner_text
          assert_equal 'text/html', elements[0].attribute('type').inner_text
        end
      end

      def test_atom_feed_self_link
        if_have 'nokogiri' do
          # Create items
          @items = [mock_entry]
          @items[0].stubs(:path).returns(nil)

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns(Time.now)
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns(nil)
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed)
          elements = doc.xpath('/atom:feed/atom:link[@rel=\'self\']', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, elements.size
          assert_equal 'http://example.com/journal/feed/', elements[0].attribute('href').inner_text
          assert_equal 'application/atom+xml', elements[0].attribute('type').inner_text
        end
      end

      def test_atom_feed_with_alt_link
        if_have 'nokogiri' do
          # Create items
          @items = [mock_entry]
          @items[0].stubs(:path).returns(nil)

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns(Time.now)
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns('/blog/')
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed)
          elements = doc.xpath('/atom:feed/atom:link[@rel=\'alternate\']', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, elements.size
          assert_equal '/blog/', elements[0].attribute('href').inner_text
        end
      end

      def test_atom_feed_entry_alt_link
        if_have 'nokogiri' do
          # Create items
          @items = [mock_entry]
          @items[0].stubs(:[]).with(:title).returns('Some Article')
          @items[0].stubs(:[]).with(:created_at).returns('01-01-2015')
          @items[0].stubs(:path).returns('/some-article/')

          # Mock site
          config = Nanoc::Core::Configuration.new(hash: { base_url: 'http://example.com' }, dir: Dir.getwd)
          @config = Nanoc::Core::ConfigView.new(config, @view_context)

          # Create feed item
          @item = mock
          @item.stubs(:identifier).returns('/feed/')
          @item.stubs(:[]).with(:title).returns('My Cool Blog')
          @item.stubs(:[]).with(:author_name).returns('Denis Defreyne')
          @item.stubs(:[]).with(:author_uri).returns('http://stoneship.org/')
          @item.stubs(:[]).with(:created_at).returns(Time.now)
          @item.stubs(:[]).with(:feed_url).returns(nil)
          @item.stubs(:[]).with(:alternate_url).returns(nil)
          @item.stubs(:path).returns('/journal/feed/')

          # Check
          doc = Nokogiri::XML(atom_feed)
          elements = doc.xpath('/atom:feed/atom:entry/atom:link[@rel=\'alternate\']', atom: 'http://www.w3.org/2005/Atom')
          assert_equal 1, elements.size
          assert_equal 'http://example.com/some-article/', elements[0].attribute('href').inner_text
          assert_equal 'text/html', elements[0].attribute('type').inner_text
        end
      end
    end
  end
end
