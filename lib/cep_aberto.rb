require "cep_aberto/version"
require "cep_aberto/configuration"
require "cep_aberto/request"

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
end