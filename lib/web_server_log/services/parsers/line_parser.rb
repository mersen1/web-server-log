# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class LineParser
        extend Extensions::Executable

        def initialize(line)
          @line = line
        end

        def execute
          [path, ip]
        end

        private

        def path
          line[%r{\A/[\w/]+}]
        end

        def ip
          line[/([0-9]{1,3}[.]){3}[0-9]{1,3}/]
        end

        attr_reader :line
      end
    end
  end
end
