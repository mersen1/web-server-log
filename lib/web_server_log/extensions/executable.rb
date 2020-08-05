# frozen_string_literal: true

module WebServerLog
  module Extensions
    module Executable
      def execute(*args)
        new(*args).execute
      end
    end
  end
end
