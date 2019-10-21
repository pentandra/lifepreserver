# frozen_string_literal: true

module LifePreserver
  module Reporting
    def benefit_reports
      @items.find_all(%r{/company/benefit-reports/\d{4}/index\.md})
    end

    def sorted_benefit_reports
      benefit_reports.sort_by(&:identifier).reverse
    end

    def fiscal_year
      /(?<fiscal_year>\d{4})/.match(@item.identifier)
    end
  end
end
