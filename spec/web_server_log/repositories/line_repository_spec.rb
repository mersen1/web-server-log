# frozen_string_literal: true

describe WebServerLog::Repositories::LineRepository do
  let!(:repository) { described_class.new }

  describe '#add_if_not_exists' do
    let(:product_path) { '/index' }

    subject { repository.add_if_not_exists(product_path) }

    context 'when such product_path does not exist' do
      it { expect { subject }.to change(repository.send(:products), :count).by(1) }
    end

    context 'when such product_path exists' do
      before { repository.send(:add, product_path) }

      it { expect { subject }.not_to change(repository.send(:products), :count) }
    end
  end
end
