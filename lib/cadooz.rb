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

require 'mixins'
require 'cadooz/models/immutable/address'
require 'cadooz/models/immutable/attributes'
require 'cadooz/models/immutable/catalog'
require 'cadooz/models/immutable/catalog_product'
require 'cadooz/models/immutable/catalog_product_variation'
require 'cadooz/models/immutable/generation_profile_product'
require 'cadooz/models/immutable/greeting_card'
require 'cadooz/models/immutable/invoice_information'
require 'cadooz/models/immutable/order'
require 'cadooz/models/immutable/order_position'
require 'cadooz/models/immutable/order_status'
require 'cadooz/models/immutable/payment'
require 'cadooz/models/immutable/product_category'
require 'cadooz/models/immutable/voucher'
require 'cadooz/models/mutable/address'
require 'cadooz/models/mutable/greeting_card'
require 'cadooz/models/mutable/invoice_information'
require 'cadooz/models/mutable/order'
require 'cadooz/models/mutable/order_position'
require 'cadooz/services/business_order_service'