# frozen_string_literal: true

module WebServerLog
  module Presenters
    module LineEntities
      class Base
        class << self
          def execute(products)
            products
              .map { |product| new(product).execute }
              .join("\n")
          end
        end

        def initialize(line_entity)
          @line_entity = line_entity
        end

        def execute
          raise NotImplementedError
        end

        private

        attr_reader :line_entity
      end
    end
  end
end
