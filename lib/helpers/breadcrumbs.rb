# frozen_string_literal: true

module LifePreserver
  module Helpers
    module Breadcrumbs
      def breadcrumbs_trail
        components = @item.identifier.components
        identifiers = (0..components.length - 1).map { |len| len.zero? ? '/index.*' : "/#{components.first(len).join('/')}/index.*" }

        identifiers.reduce([]) do |memo, id|
          found = @items[id]
          memo << found if found
        end
      end
    end
  end
end
