module Pentandra
  
  # A few functional helpers, mostly borrowed from
  # http://www.randomhacks.net/2007/02/01/some-useful-closures-in-ruby/
  module Functional

    # Builds a function that returns true
    # when 'f' returns false, and vice versa.
    def complement(f)
      lambda { |*args| not f.call(*args) }
    end

    # Builds a function which calls 'f' with
    # the return value of 'g'.
    def compose(f, g)
      lambda { |*args| f.call(g.call(*args)) }
    end

    # Builds a function which returns true
    # whenever _every_ function in 'predicates'
    # returns true.
    def conjoin(*predicates)
      base = lambda { |*args| true }
      predicates.inject(base) do |built, pred|
        lambda do |*args|
          built.call(*args) and pred.call(*args)
        end
      end
    end

    # Builds a function which returns true
    # whenever _any_ function in 'predicates'
    # returns true.
    def disjoin(*predicates)
      base = lambda { |*args| false }
      predicates.inject(base) do |built, pred|
        lambda do |*args|
          built.call(*args) or pred.call(*args)
        end
      end
    end

  end

end
