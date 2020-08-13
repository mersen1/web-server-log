# frozen_string_literal: true

module WebServerLog
  class OrdinaryParser < Parser
    def execute
      file.each do |line|
        path, = Services::Parsers::LineParser.execute(line)
        product = repository.add_if_not_exists(path, nil)
        Services::LineEntities::IncrementVisitsCount.execute(product)
      end
      presenter.execute(repository.sort!.products)
    end
  end
end
