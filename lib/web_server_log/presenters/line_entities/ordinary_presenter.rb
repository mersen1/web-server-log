# frozen_string_literal: true

module WebServerLog
  module Presenters
    module LineEntities
      class OrdinaryPresenter < Base
        def execute
          "#{line_entity.path} #{line_entity.visits} visits"
        end
      end
    end
  end
end
