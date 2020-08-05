# frozen_string_literal: true

module WebServerLog
  class Parser
    class << self
      def execute(file_path)
        file = File.open(file_path, 'r')
        new(file).execute
      ensure
        file.close
      end
    end

    private_class_method :new

    def initialize(file)
      @file = file
    end

    def execute
      # TODO
    end

    attr_reader :file
  end
end
