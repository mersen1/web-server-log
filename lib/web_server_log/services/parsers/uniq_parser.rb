# frozen_string_literal: true

module WebServerLog
  module Services
    module Parsers
      class UniqParser < Base
        def execute
          [path, ip]
        end
      end
    end
  end
end
