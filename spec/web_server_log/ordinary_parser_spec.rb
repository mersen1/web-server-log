# frozen_string_literal: true

describe WebServerLog::OrdinaryParser do # rubocop:disable Metrics/BlockLength
  let(:file_path) { './spec/fixtures/webserver.log' }
  let(:file) { File.open(file_path) }
  let(:presenter) { WebServerLog::Presenters::LineEntities::OrdinaryPresenter }

  let(:repository) { WebServerLog::Repositories::LineRepository.new }

  describe '.execute' do
    before do
      allow(File).to receive(:open).with(file_path, 'r').and_return(file)
    end

    subject { described_class.execute(file_path, presenter) }

    it 'closes file after execution' do
      subject
      expect(file.closed?).to be_truthy
    end
  end

  describe '#execute' do
    before do
      allow_any_instance_of(described_class).to receive(:repository).and_return(repository)
    end

    subject { described_class.send(:new, file, presenter).execute }

    it 'fills repository' do
      expect { subject }.to change(repository.products, :count).by(3)
    end

    it 'increase each repository product`s visits' do
      subject
      repository.products.each do |product|
        expect(product.visits).to be >= 1
      end
    end

    it 'returns sorted string of visits' do
      is_expected.to eq("/home 3 visits\n/help_page/1 1 visits\n/contact 1 visits")
    end
  end
end
