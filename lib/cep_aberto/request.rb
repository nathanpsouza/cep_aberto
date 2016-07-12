require "net/http"
require "uri"

module CepAberto
  class Request
    def get_headers
      {'Authorization': "Token token=#{CepAberto.configuration.token}"}
    end

    def get_endpoint
      CepAberto.configuration.endpoint + "/api/" + CepAberto.configuration.version + "/ceps." + CepAberto.configuration.format.to_s
    end

    def do_request(params)
      uri = URI.parse(get_endpoint)

      http = Net::HTTP.new(uri.host, uri.port)
      
      request = Net::HTTP::Get.new(uri.request_uri, get_headers)
      request.set_form_data( params )

      response = http.request(request)

      raise InvalidToken.new("The provided token is invalid.") if response.kind_of?(Net::HTTPUnauthorized) || response.kind_of?(Net::HTTPForbidden)

      response.body.force_encoding("UTF-8")
    end
  end

  class InvalidToken < Exception
  end
end