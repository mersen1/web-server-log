# frozen_string_literal: true

describe WebServerLog::Repositories::LineRepository do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to have_attributes(products: []) }
  end
end
