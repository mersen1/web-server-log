# frozen_string_literal: true

module WebServerLog
  module Entities
    class LineEntity
      attr_reader :path
      attr_accessor :visits

      def initialize(path)
        @path = path
        @visits = 0
      end
    end
  end
end
