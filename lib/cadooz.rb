require 'savon'

module Cadooz
  class Configuration
    attr_accessor :username, :password, :wsdl, :generation_profile

    WSDL = 'https://webservices.cadooz.com/services/businessorder/1.5.2/BusinessOrderService/BusinessOrder?wsdl'
    TEST_USERNAME = 'cadooz'
    TEST_PASSWORD = 'Cadooz2015'

    def initialize(username, password, generation_profile)
      self.username = username || TEST_USERNAME
      self.password = password || TEST_PASSWORD
      self.wsdl = WSDL
      self.generation_profile = generation_profile
    end
  end

  def self.configuration
    @configuration ||= Configuration.new(nil, nil, nil)
  end

  def self.configure
    yield(configuration) if block_given?
  end
end

require_relative 'cadooz/business_order_service'