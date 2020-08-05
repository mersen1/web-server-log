# frozen_string_literal: true

module WebServerLog
  module Services
    module LineRepositories
      class DescendingVisitsSorter
        extend Extensions::Executable

        def initialize(products)
          @products = products
        end

        def execute
          products.sort { |a, b| b.visits <=> a.visits }
        end

        private

        attr_reader :products
      end
    end
  end
end
