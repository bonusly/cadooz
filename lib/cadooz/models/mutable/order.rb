class Cadooz::Mutable::Order
  include ::Mixins

  attr_accessor :client, :commission, :cost_owner, :cost_unit, :credit_or_number,
                :customer_reference_number, :delivery_address, :generation_profile,
                :greeting_card, :invoice_address, :invoice_information, :language,
                :order_attributes, :order_description, :order_positions, :payment_informations,
                :queue, :send_mail, :test, :website

  def initialize
    @client = nil
    @commission = nil
    @cost_owner = nil
    @cost_unit = nil
    @credit_or_number = nil
    @customer_reference_number = nil
    @delivery_address = Cadooz::Address.new
    @generation_profile = nil
    @greeting_card = Cadooz::GreetingCard.new
    @invoice_address = Cadooz::Address.new
    @invoice_information = [] # Cadooz::InvoiceInformation
    @language = nil
    @order_attributes = nil
    @order_description = nil
    @order_positions = [] # Cadooz::OrderPosition
    @payment_informations = nil
    @queue = nil
    @send_mail = nil
    @test = nil
    @website = nil
  end
end