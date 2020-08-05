# frozen_string_literal: true

describe WebServerLog::Services::LineRepositories::DescendingVisitsOrderer do
  describe '.execute' do
    let(:products) do
      [
        WebServerLog::Entities::LineEntity.new('/index/1'),
        WebServerLog::Entities::LineEntity.new('/home')
      ].map.with_index do |entity, index|
        entity.visits = index
        entity
      end
    end

    subject { described_class.execute(products) }

    it 'orders in descending order' do
      is_expected.to eq(products.reverse)
    end
  end
end
