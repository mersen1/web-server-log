# frozen_string_literal: true

describe WebServerLog::Parser do # rubocop:disable Metrics/BlockLength
  let(:file_path) { './spec/fixtures/webserver.log' }
  let(:file) { File.open(file_path) }
  let(:parser) { WebServerLog::Services::Parsers::OrdinaryParser }

  describe '.execute' do
    before do
      allow(File).to receive(:open).with(file_path, 'r').and_return(file)
    end

    subject { described_class.execute(file_path, parser) }

    it 'closes file after execution' do
      subject
      expect(file.closed?).to be_truthy
    end
  end

  describe '#execute' do
    let!(:repository) { WebServerLog::Repositories::LineRepository.new }

    subject { described_class.send(:new, file, parser).execute }

    before do
      allow_any_instance_of(described_class).to receive(:repository).and_return(repository)
    end

    it 'fills repository' do
      expect { subject }.to change(repository.send(:products), :count).by(3)
    end

    it 'increase each product`s visits by 1' do
      subject
      repository.send(:products).each do |product|
        expect(product.visits).to eq(1)
      end
    end
  end
end
