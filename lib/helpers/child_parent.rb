# frozen_string_literal: true

module LifePreserver
  module Helpers
    module ChildParent
      def parent_of(item, parent_pattern: 'index.*')
        if item.identifier.legacy?
          item.parent
        else
          path_without_last_component = item.identifier.to_s.sub(/[^\/]+\/[^\/]+$/, '').chop
          @items[path_without_last_component + '/' + parent_pattern]
        end
      end

      def children_of(item, child_pattern: 'index.*')
        if item.identifier.legacy?
          item.children
        else
          path_without_last_component = item.identifier.to_s.sub(/[^\/]+$/, '').chop
          pattern = path_without_last_component + '/*/' + child_pattern
          @items.find_all(pattern)
        end
      end
    end
  end
end
