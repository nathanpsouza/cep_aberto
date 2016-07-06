require 'spec_helper'

module CepAberto
  describe Configuration do
    let(:configuration) { described_class.new }
    describe '#token' do
      it 'default value is nil' do
        expect(configuration.token).to be_nil
      end
    end

    describe '#token=' do
      it 'can set value' do
        configuration.token = 'new_token'
        expect(configuration.token).to eq('new_token')
      end
    end
  end
end