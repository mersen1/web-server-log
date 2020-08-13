# frozen_string_literal: true

module WebServerLog
  class Parser
    class << self
      def execute(file_path, *args)
        file = File.open(file_path, 'r')
        new(file, *args).execute
      ensure
        file.close
      end
    end

    private_class_method :new

    def initialize(file, presenter, sorter = nil)
      @file = file
      @presenter = presenter
      @sorter = sorter
    end

    def execute
      raise NotImplementedError
    end

    private

    def repository
      @repository ||= Repositories::LineRepository.new(sorter)
    end

    attr_reader :file, :parser, :presenter, :sorter
  end
end
