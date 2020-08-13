# frozen_string_literal: true

module WebServerLog
  class OrdinaryParser < Parser
    def execute
      file.each do |line|
        path, = Services::Parsers::LineParser.execute(line)
        product = repository.find_by_path(path)
        product = repository.add(path, nil) if product.nil?
        Services::LineEntities::IncrementVisitsCount.execute(product)
      end
      presenter.execute(repository.sort)
    end
  end
end
