# frozen_string_literal: true

describe WebServerLog::Services::Parsers::OrdinaryParser do
  context '#execute' do
    let!(:line) { '/help_page/1 200.017.277.774' }

    subject { described_class.new(line).execute }

    it 'returns array with path' do
      is_expected.to eq(['/help_page/1'])
    end
  end
end
