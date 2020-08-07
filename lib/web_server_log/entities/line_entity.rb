# frozen_string_literal: true

module WebServerLog
  module Entities
    class LineEntity
      attr_reader :path, :ip
      attr_accessor :visits

      def initialize(path, ip)
        @path = path
        @ip = ip
        @visits = 0
      end
    end
  end
end
