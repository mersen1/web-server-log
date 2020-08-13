# frozen_string_literal: true

module WebServerLog
  module Repositories
    class LineRepository
      attr_accessor :products

      def initialize(sorter = nil)
        @products = []
        @sorter = sorter || Services::LineRepositories::DescendingVisitsSorter
      end

      def sort
        sorter.execute(products)
      end

      def add(product_path, product_ip)
        products.push(product = Entities::LineEntity.new(product_path, product_ip))
        product
      end

      def find_by_path(product_path)
        products.detect { |product| product.path == product_path }
      end

      private

      attr_reader :sorter
    end
  end
end
