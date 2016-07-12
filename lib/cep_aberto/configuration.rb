module CepAberto
  class Configuration
    attr_accessor :token, :format, :endpoint, :version

    def initialize
      @token = nil
      @format = :json
      @endpoint = "http://www.cepaberto.com"
      @version = "v2"
    end
  end
end