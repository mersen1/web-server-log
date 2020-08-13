# frozen_string_literal: true

module WebServerLog
  class UniqParser < Parser
    def execute
      file.each do |line|
        path, ip = Services::Parsers::LineParser.execute(line)
        product = repository.find_by_path(path)

        if product.nil?
          repository.add(path, ip).increment_visits!
          next
        end
        next if product.ips.include?(ip)

        product.add_ip(ip)
        product.increment_visits!
      end

      presenter.execute(repository.sort)
    end
  end
end
