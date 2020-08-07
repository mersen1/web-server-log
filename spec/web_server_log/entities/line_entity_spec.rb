# frozen_string_literal: true

describe WebServerLog::Entities::LineEntity do
  describe '.new' do
    let(:ip) { '184.123.665.067' }
    let(:path) { '/index' }

    subject { described_class.new(path, ip) }

    it { is_expected.to have_attributes(path: path, ip: ip, visits: 0) }

    context 'when path is invalid' do
      # TODO
    end
  end
end
