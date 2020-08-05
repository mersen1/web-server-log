# frozen_string_literal: true

describe WebServerLog::Entities::LineEntity do
  describe '.new' do
    let(:path) { '/index' }

    subject { described_class.new(path) }

    it { is_expected.to have_attributes(path: path, visits: 0) }

    context 'when path is invalid' do
      # TODO
    end
  end
end
