# frozen_string_literal: true

module WebServerLog
  module Presenters
    module LineEntities
      class UniqPresenter < Base
        def execute
          "#{line_entity.path} #{line_entity.visits} unique views"
        end
      end
    end
  end
end
