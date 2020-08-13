# frozen_string_literal: true

describe WebServerLog::OrdinaryParser do
  let(:file_path) { './spec/fixtures/webserver.log' }
  let(:file) { File.open(file_path) }
  let(:presenter) { WebServerLog::Presenters::LineEntities::OrdinaryPresenter }

  let(:repository) { WebServerLog::Repositories::LineRepository.new }

  describe '#execute' do
    before do
      allow_any_instance_of(described_class).to receive(:repository).and_return(repository)
    end

    subject { described_class.send(:new, file, presenter).execute }

    it do
      is_expected.to eq()
    end
  end
end
