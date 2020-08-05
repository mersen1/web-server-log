# frozen_string_literal: true

class JhonDoe
  extend WebServerLog::Extensions::Executable

  def execute
    'foo'
  end
end

describe WebServerLog::Extensions::Executable do
  let(:klass) { JhonDoe }
  let(:obj) { klass.new }

  describe '.execute' do
    subject { klass.execute }

    it { is_expected.to eq(obj.execute) }
  end
end
