require 'json'
require 'ostruct'
require 'pry'
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

require_relative 'cadooz/address'
require_relative 'cadooz/attributes'
require_relative 'cadooz/business_order_service'
require_relative 'cadooz/catalog'
require_relative 'cadooz/catalog_product'
require_relative 'cadooz/catalog_product_variation'
require_relative 'cadooz/generation_profile_product'
require_relative 'cadooz/greeting_card'
require_relative 'cadooz/invoice_information'
require_relative 'cadooz/order'
require_relative 'cadooz/order_position'
require_relative 'cadooz/order_status'
require_relative 'cadooz/payment'
require_relative 'cadooz/product_category'