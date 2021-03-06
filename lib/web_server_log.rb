# frozen_string_literal: true

module WebServerLog
  module Entities; end
  module Extensions; end
  module Repositories; end
  module Presenters; end
  module Services; end
end

require_relative 'web_server_log/parser'
require_relative 'web_server_log/ordinary_parser'
require_relative 'web_server_log/uniq_parser'

require_relative 'web_server_log/entities/line_entity'
require_relative 'web_server_log/extensions/executable'
require_relative 'web_server_log/repositories/line_repository'

require_relative 'web_server_log/services/parsers/line_parser'
require_relative 'web_server_log/services/line_entities/increment_visits_count'
require_relative 'web_server_log/services/line_repositories/descending_visits_sorter'

require_relative 'web_server_log/presenters/line_entities/base'
require_relative 'web_server_log/presenters/line_entities/ordinary_presenter'
require_relative 'web_server_log/presenters/line_entities/uniq_presenter'
