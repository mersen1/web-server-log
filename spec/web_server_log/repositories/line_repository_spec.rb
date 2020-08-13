# frozen_string_literal: true

describe WebServerLog::Repositories::LineRepository do
  let!(:repository) { described_class.new }

  let(:product_path) { '/index' }
  let(:product_ip) { '184.123.665.067' }

  describe '#add' do
    subject { repository.add(product_path, product_ip) }

    it 'changes count of products' do
      expect { subject }.to change(repository.products, :count).by(1)
    end

    it 'returns product' do
      is_expected.to be_an_instance_of(WebServerLog::Entities::LineEntity)
    end
  end
end
