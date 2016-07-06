require 'spec_helper'

describe CepAberto do
  it 'has a version number' do
    expect(CepAberto::VERSION).not_to be nil
  end

  describe '#configure' do
    let(:token) { 'e0651e486d375337f9636417f7bd1f89' }

    before do
      CepAberto.configure do |config|
        config.token = token
      end
    end

    it 'set token for api access' do
      expect(CepAberto.configuration.token).to eq(token)
    end
  end
end
