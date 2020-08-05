# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class UniqParser < Base
        def execute
          line[%r{\A/[\w/]+}]
        end
      end
    end
  end
end
