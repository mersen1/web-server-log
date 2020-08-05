# frozen_string_literal: true

describe WebServerLog::Services::Parsers::Base do
  context '.execute' do
    let(:line) { nil }

    subject { described_class.execute(line) }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
