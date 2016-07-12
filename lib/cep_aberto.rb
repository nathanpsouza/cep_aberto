require "cep_aberto/version"
require "cep_aberto/configuration"
require "cep_aberto/request"
require "json"

module CepAberto
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end


  def self.configure
    yield(configuration)
  end

  def self.reset_configuration
    @configuration = Configuration.new
  end

  def self.find_by_cep cep
    request = Request.new

    JSON.parse(request.do_request(cep: cep))
  end
end