# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class Base
        extend Extensions::Executable

        def initialize(line)
          @line = line
        end

        def execute
          raise NotImplementedError
        end

        private

        attr_reader :line
      end
    end
  end
end
