# frozen_string_literal: true

module WebServerLog
  module Repositories
    class LineRepository
      def initialize
        @products = []
      end

      attr_reader :products
    end
  end
end
