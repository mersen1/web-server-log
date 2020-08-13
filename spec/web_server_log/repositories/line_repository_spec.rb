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

  describe '#add_if_not_exists' do
    subject { repository.add_if_not_exists(product_path, product_ip) }

    shared_examples :change_repository_products_count do
      it { expect { subject }.to change(repository.products, :count).by(1) }
    end

    context 'when ip is nil' do
      let(:product_ip) { '184.123.665.067' }

      include_examples :change_repository_products_count
    end

    context 'when such product_path does not exist' do
      include_examples :change_repository_products_count
    end

    context 'when such product_path exists' do
      before { repository.add(product_path, product_ip) }

      it { expect { subject }.not_to change(repository.products, :count) }
    end
  end
end
