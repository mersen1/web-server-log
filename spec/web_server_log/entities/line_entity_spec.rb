# frozen_string_literal: true

describe WebServerLog::Entities::LineEntity do
  let(:ip) { '184.123.665.067' }
  let(:path) { '/index' }

  describe '.new' do
    subject { described_class.new(path, ip) }

    it { is_expected.to have_attributes(path: path, ips: [ip], visits: 0) }

    context 'when path is invalid' do
      # TODO
    end
  end

  describe '#increment_visits!' do
    let!(:line_entity) { described_class.new(path, ip) }

    subject { line_entity.increment_visits! }

    it { expect { subject }.to change(line_entity, :visits).by(1) }
  end

  describe '#add_ip' do
    let!(:line_entity) { described_class.new(path, ip) }

    let(:new_ip) { ip.reverse }

    subject { line_entity.add_ip(new_ip) }

    it { expect { subject }.to change(line_entity, :ips).to([ip, new_ip]) }
  end
end
