# frozen_string_literal: true

module WebServerLog
  class Parser
    class << self
      def execute(file_path, parser)
        file = File.open(file_path, 'r')
        new(file, parser).execute
      ensure
        file.close
      end
    end

    private_class_method :new

    def initialize(file, parser)
      @file = file
      @parser = parser
    end

    def execute
      # TODO
    end

    private

    attr_reader :file, :parser
  end
end
