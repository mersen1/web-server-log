# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class OrdinaryParser < Base
        def execute
          line[%r{\A/[a-z_]+}]
        end
      end
    end
  end
end
