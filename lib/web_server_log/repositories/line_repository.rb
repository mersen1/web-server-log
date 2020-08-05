# frozen_string_literal: true

module WebServerLog
  module Repositories
    class LineRepository
      def initialize
        @products = []
      end

      def add_if_not_exists(product_path)
        return add(product_path) if (product = find_by_path(product_path)).nil?

        product
      end

      private

      def add(product_path)
        products.push(product = Entities::LineEntity.new(product_path))
        product
      end

      def find_by_path(product_path)
        products.detect { |product| product.path == product_path }
      end

      attr_accessor :products
    end
  end
end
