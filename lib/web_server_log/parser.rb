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
      file.each do |line|
        path = parser.execute(line)
        product = repository.add_if_not_exists(path)
        Services::LineEntities::IncrementVisitsCount.execute(product)
      end
    end

    private

    def repository
      @repository ||= Repositories::LineRepository.new
    end

    attr_reader :file, :parser
  end
end
