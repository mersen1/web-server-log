# frozen_string_literal: true

module WebServerLog
  module Services
    module LineEntities
      class IncrementVisitsCount
        extend Extensions::Executable

        def initialize(line_entity)
          @line_entity = line_entity
        end

        def execute
          line_entity.visits += 1
        end

        private

        attr_reader :line_entity
      end
    end
  end
end
