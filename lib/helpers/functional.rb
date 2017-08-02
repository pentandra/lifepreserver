# frozen_string_literal: true

# A few functional helpers, mostly borrowed from
# http://www.randomhacks.net/2007/02/01/some-useful-closures-in-ruby/

module LifePreserver
  module Functional
    # Builds a function that returns true
    # when 'f' returns false, and vice versa.
    def complement(f)
      ->(*args) { !f.call(*args) }
    end

    # Builds a function which calls 'f' with
    # the return value of 'g'.
    def compose(f, g)
      ->(*args) { f.call(g.call(*args)) }
    end

    # Builds a function which returns true
    # whenever _every_ function in 'predicates'
    # returns true.
    def conjoin(*predicates)
      base = ->(*args) { true }
      predicates.inject(base) do |built, pred|
        lambda do |*args|
          built.call(*args) && pred.call(*args)
        end
      end
    end

    # Builds a function which returns true
    # whenever _any_ function in 'predicates'
    # returns true.
    def disjoin(*predicates)
      base = ->(*args) { false }
      predicates.inject(base) do |built, pred|
        lambda do |*args|
          built.call(*args) || pred.call(*args)
        end
      end
    end
  end
end
