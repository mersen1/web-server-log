# frozen_string_literal: true

module WebServerLog
  module Services
    module LineRepositories
      class DescendingVisitsOrderer
        extend Extensions::Executable

        def initialize(products)
          @products = products
        end

        def execute
          products
        end

        private

        attr_reader :products
      end
    end
  end
end
