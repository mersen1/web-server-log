# frozen_string_literal: true

module WebServerLog
  module Repositories
    class LineRepository
      attr_accessor :products

      def initialize(sorter = nil)
        @products = []
        @sorter = sorter || Services::LineRepositories::DescendingVisitsSorter
      end

      def sort!
        self.products = sorter.execute(products)
        self
      end

      def add_if_not_exists(product_path)
        return add(product_path) if (product = find_by_path(product_path)).nil?

        product
      end

      private

      attr_reader :sorter

      def add(product_path)
        products.push(product = Entities::LineEntity.new(product_path))
        product
      end

      def find_by_path(product_path)
        products.detect { |product| product.path == product_path }
      end
    end
  end
end
