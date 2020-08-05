# frozen_string_literal: true

describe WebServerLog::Services::Parsers::OrdinaryParser do
  context '#execute' do
    let!(:line) { '/help_page/1 200.017.277.774' }

    subject { described_class.new(line).execute }

    context 'when line has params' do
      it { is_expected.to eq('/help_page') }
    end

    context 'when line does not have params' do
      let!(:line) { '/help_page 200.017.277.774' }

      it { is_expected.to eq('/help_page') }
    end
  end
end
