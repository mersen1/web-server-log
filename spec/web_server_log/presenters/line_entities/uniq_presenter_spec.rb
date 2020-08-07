# frozen_string_literal: true

describe WebServerLog::Presenters::LineEntities::UniqPresenter do
  describe '.execute' do
    let!(:products) do
      (1..2).to_a.map { |index| WebServerLog::Entities::LineEntity.new("/index/#{index}") }
    end

    subject { described_class.execute(products) }

    it 'converts to string' do
      is_expected.to eq("/index/1 0 unique views\n/index/2 0 unique views")
    end
  end
end
