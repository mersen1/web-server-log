# frozen_string_literal: true

module WebServerLog
  module Entities
    class LineEntity
      attr_reader :path, :ips
      attr_accessor :visits

      def initialize(path, ip = nil)
        @path = path
        @ips = [ip]
        @visits = 0
      end

      def add_ip(ip)
        ips.push(ip)
      end

      def increment_visits!
        self.visits += 1
      end
    end
  end
end
