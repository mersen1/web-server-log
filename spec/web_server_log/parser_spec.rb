# frozen_string_literal: true

describe WebServerLog::Parser do
  let(:file_path) { './spec/fixtures/webserver.log' }
  let(:file) { File.open(file_path) }
  let(:presenter) { WebServerLog::Presenters::LineEntities::OrdinaryPresenter }

  describe '#execute' do
    subject { described_class.send(:new, file, presenter).execute }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
