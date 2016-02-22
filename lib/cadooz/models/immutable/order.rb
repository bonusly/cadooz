class Cadooz::Immutable::Order
  include Mixins

  attr_reader :client, :commission, :cost_owner, :cost_unit, :credit_or_number,
              :customer_reference_number, :delivery_address, :generation_profile,
              :greeting_card, :invoice_address, :invoice_information, :language,
              :order_attributes, :order_description, :order_positions, :payment_informations,
              :queue, :send_mail, :test, :website

  def initialize(open_struct)
    @client = open_struct&.client
    @commission = open_struct&.commission
    @cost_owner = open_struct&.cost_owner
    @cost_unit = open_struct&.cost_unit
    @credit_or_number = open_struct&.credit_or_number
    @customer_reference_number = open_struct&.customer_reference_number
    @delivery_address = Cadooz::Immutable::Address.new(open_struct&.delivery_address)
    @generation_profile = open_struct&.generation_profile
    @greeting_card = Cadooz::Immutable::GreetingCard.new(open_struct&.greeting_card)
    @invoice_address = Cadooz::Immutable::Address.new(open_struct&.invoice_address)
    @invoice_information = open_struct&.invoice_information&.each_with_object([]) { |i, arr| arr << Cadooz::Immutable::InvoiceInformation(i) }
    @language = open_struct&.language
    @order_attributes = open_struct&.order_attributes&.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @order_description = open_struct&.order_description
    @order_positions = open_struct&.order_positions&.each_with_object([]) { |o, arr| arr << Cadooz::Immutable::OrderPosition(o) }
    @payment_informations = open_struct&.payment_informations
    @queue = open_struct&.queue
    @send_mail = open_struct&.send_mail
    @test = open_struct&.test
    @website = open_struct&.website

    self.freeze
  end
end