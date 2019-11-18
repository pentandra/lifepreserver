# frozen_string_literal: true

module LifePreserver
  module Helpers
    module Proposals
      def proposals
        @items.find_all('/static/solutions/proposals/*/index.md')
      end

      # Get the state of the proposal
      #
      # @return [String] the status (either draft, submitted, accepted, rejected)
      def proposal_status(proposal)
        if proposal.key?(:decision)
          proposal.fetch(:decision)
        else
          proposal[:submitted_at].nil? ? 'draft' : 'submitted'
        end
      end
    end
  end
end
