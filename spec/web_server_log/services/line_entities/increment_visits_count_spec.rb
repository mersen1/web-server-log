# frozen_string_literal: true

describe WebServerLog::Services::LineEntities::IncrementVisitsCount do
  context '.execute' do
    let(:line_entity) do
      WebServerLog::Entities::LineEntity.new('/index')
    end

    subject { described_class.execute(line_entity) }

    it { expect { subject }.to change(line_entity, :visits).by(1) }
  end
end
