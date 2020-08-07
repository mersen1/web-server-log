# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class OrdinaryParser < Base
        def execute
          [path]
        end
      end
    end
  end
end
