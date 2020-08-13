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

      def add_if_not_exists(product_path, product_ip)
        product = find_by_path_and_ip(product_path, product_ip)

        return add(product_path, product_ip) if product.nil?

        product
      end

      def add(product_path, product_ip)
        products.push(product = Entities::LineEntity.new(product_path, product_ip))
        product
      end

      def find_by_path(product_path)
        products.detect { |product| product.path == product_path }
      end

      def find_by_path_and_ip(product_path, product_ip)
        products.detect { |product| product.path == product_path && product.ips.include?(product_ip) }
      end

      private

      attr_reader :sorter
    end
  end
end
