# frozen_string_literal: true

describe WebServerLog::Repositories::LineRepository do
  let!(:repository) { described_class.new }

  describe '#add_if_not_exists' do
    let(:product_path) { '/index' }
    let(:product_ip) { '184.123.665.067' }

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
      before { repository.send(:add, product_path, product_ip) }

      it { expect { subject }.not_to change(repository.products, :count) }
    end
  end
end
