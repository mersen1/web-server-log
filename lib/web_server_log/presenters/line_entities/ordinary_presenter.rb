# frozen_string_literal: true

module WebServerLog
  module Presenters
    module LineEntities
      class OrdinaryPresenter
        class << self
          def execute(products)
            products
              .map { |product| new(product).execute }
              .join(' ')
          end
        end

        def initialize(line_entity)
          @line_entity = line_entity
        end

        def execute
          "#{line_entity.path} #{line_entity.visits} visits"
        end

        private

        attr_reader :line_entity
      end
    end
  end
end
