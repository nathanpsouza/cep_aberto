require 'spec_helper'

describe CepAberto do
  let(:token) { 'e0651e486d375337f9636417f7bd1f89' }

  before do
    CepAberto.configure do |config|
      config.token = token
    end
  end

  it 'has a version number' do
    expect(CepAberto::VERSION).not_to be nil
  end

  describe '#configure' do
    it 'set token for api access' do
      expect(CepAberto.configuration.token).to eq(token)
    end

    it 'set format to :json' do
      expect(CepAberto.configuration.format).to eq(:json)
    end
  end

  describe '#reset_configuration' do
    it 'reset configs to default' do
      CepAberto.reset_configuration
      expect(CepAberto.configuration.token).to be_nil
    end
  end
end
