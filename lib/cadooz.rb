require 'json'
require 'money'
require 'ostruct'
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

  module Immutable end
  module Mutable end
end

require_relative 'mixins'
require_relative 'cadooz/models/immutable/address'
require_relative 'cadooz/models/immutable/attributes'
require_relative 'cadooz/models/immutable/catalog'
require_relative 'cadooz/models/immutable/catalog_product'
require_relative 'cadooz/models/immutable/catalog_product_variation'
require_relative 'cadooz/models/immutable/generation_profile_product'
require_relative 'cadooz/models/immutable/greeting_card'
require_relative 'cadooz/models/immutable/invoice_information'
require_relative 'cadooz/models/immutable/order'
require_relative 'cadooz/models/immutable/order_position'
require_relative 'cadooz/models/immutable/order_status'
require_relative 'cadooz/models/immutable/payment'
require_relative 'cadooz/models/immutable/product_category'
require_relative 'cadooz/models/immutable/response.rb'
require_relative 'cadooz/models/immutable/voucher'
require_relative 'cadooz/models/mutable/address'
require_relative 'cadooz/models/mutable/greeting_card'
require_relative 'cadooz/models/mutable/invoice_information'
require_relative 'cadooz/models/mutable/order'
require_relative 'cadooz/models/mutable/order_position'
require_relative 'cadooz/models/mutable/payment'
require_relative 'cadooz/services/business_order_service'