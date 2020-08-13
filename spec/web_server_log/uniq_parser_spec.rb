# frozen_string_literal: true

describe WebServerLog::UniqParser do
  let(:file_path) { './spec/fixtures/webserver.log' }
  let(:file) { File.open(file_path) }
  let(:presenter) { WebServerLog::Presenters::LineEntities::UniqPresenter }

  let(:repository) { WebServerLog::Repositories::LineRepository.new }

  describe '.execute' do
    before do
      allow_any_instance_of(described_class).to receive(:repository).and_return(repository)
    end

    subject { described_class.execute(file, presenter) }

    it do
      is_expected.to eq("/home 2 unique views\n/help_page/1 1 unique views\n/contact 1 unique views")
    end
  end
end
