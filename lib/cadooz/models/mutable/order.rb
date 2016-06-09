class Cadooz::Mutable::Order
  include ::Mixins

  attr_accessor :client, :commission, :cost_owner, :cost_unit, :credit_or_number,
                :customer_reference_number, :delivery_address, :generation_profile,
                :greeting_card, :invoice_address, :invoice_information, :language,
                :order_attributes, :order_description, :order_positions, :payment_informations,
                :queue, :send_mail, :test, :website

  def initialize(args={})
    @client = args[:client]
    @commission = args[:commission]
    @cost_owner = args[:cost_owner]
    @cost_unit = args[:cost_unit]
    @credit_or_number = args[:credit_or_number]
    @customer_reference_number = args[:customer_reference_number]
    @delivery_address = args[:delivery_address] # Cadooz::Mutable::Address.new
    @generation_profile = args[:generation_profile]
    @greeting_card = args[:greeting_card] # Cadooz::Mutable::GreetingCard.new
    @invoice_address = args[:invoice_address] # Cadooz::Mutable::Address.new
    @invoice_information = args[:invoice_information] # Cadooz::Mutable::InvoiceInformation
    @language = args[:language]
    @order_attributes = args[:order_attributes]
    @order_description = args[:order_description]
    @order_positions = args[:order_positions] # Cadooz::Mutable::OrderPosition
    @payment_informations = args[:payment_informations] # Cadooz::Mutable::Payment
    @queue = args[:queue]
    @send_mail = args[:send_mail]
    @test = args[:test]
    @website = args[:website]

    default_value_for_nil
  end
end