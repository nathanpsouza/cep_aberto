require 'spec_helper'

module CepAberto
  describe Request do
    let(:request) {described_class.new}
    let(:token) { 'e0651e486d375337f9636417f7bd1f89' }

    before do
      CepAberto.configure do |config|
        config.token = token
      end
    end
    
    describe '#get_headers' do
      it 'return authorization hash' do
        expect(request.get_headers).to eq({'Authorization': "Token token=#{token}"})
      end
    end

    describe '#get_endpoint' do
      it 'return full url with format' do
        expect(request.get_endpoint).to eq("http://www.cepaberto.com/api/v2/ceps.json")
      end
    end

    describe '#do_request' do
      context 'with token' do
        it 'query cepaberto api' do
          expect(request.do_request(cep: '85945000')).to eq(
            %Q{{"altitude":540.0,"bairro":null,"cep":"85945000","latitude":"-24.5878199992","longitude":"-53.512","logradouro":"Tupãssi","cidade":"Tupãssi","ddd":44,"ibge":"4127957","estado":"PR"}}
          )
        end
      end

      context 'without token' do
        it 'raise invalid token exception' do
          CepAberto.reset_configuration

          expect {
            request.do_request(cep: '85945000')
          }.to raise_error(InvalidToken)
        end
      end
    end
  end
end