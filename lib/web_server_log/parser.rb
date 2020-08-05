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

    def initialize(file, parser, presenter, sorter = nil)
      @file = file
      @parser = parser
      @presenter = presenter
      @sorter = sorter
    end

    def execute
      file.each do |line|
        path = parser.execute(line)
        product = repository.add_if_not_exists(path)
        Services::LineEntities::IncrementVisitsCount.execute(product)
      end
      presenter.execute(repository.sort!.products)
    end

    private

    def repository
      @repository ||= Repositories::LineRepository.new(sorter)
    end

    attr_reader :file, :parser, :presenter, :sorter
  end
end
