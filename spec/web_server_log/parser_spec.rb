# frozen_string_literal: true

describe WebServerLog::Parser do
  describe '.execute' do
    let(:file_path) { './spec/fixtures/webserver.log' }
    let(:file) { File.open(file_path) }

    before do
      allow(File).to receive(:open).with(file_path, 'r').and_return(file)
    end

    subject { described_class.execute(file_path) }

    it 'closes file after execution' do
      subject
      expect(file.closed?).to be_truthy
    end
  end
end
