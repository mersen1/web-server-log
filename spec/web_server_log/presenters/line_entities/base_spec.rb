# frozen_string_literal: true

describe WebServerLog::Presenters::LineEntities::Base do
  describe '.execute' do
    subject do
      described_class
        .execute([WebServerLog::Entities::LineEntity.new('/index')])
    end

    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
