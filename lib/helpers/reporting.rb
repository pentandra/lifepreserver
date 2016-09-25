module LifePreserver

  module Reporting

    def benefit_reports
      blk = -> { @items.find_all(%r{/company/benefit-reports/\d{4}/index\.md}) }
      if @items.frozen?
        @benefit_report_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_benefit_reports
      blk = -> { benefit_reports.sort_by(&:identifier).reverse }
      if @items.frozen?
        @sorted_benefit_report_items ||= blk.call
      else
        blk.call
      end
    end

  end

end
