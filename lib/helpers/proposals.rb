module LifePreserver
  module Proposals
    def proposals
      blk = -> { @items.find_all('/static/solutions/proposals/*/index.md') }
      if @items.frozen?
        @proposal_items ||= blk.call
      else
        blk.call
      end
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
