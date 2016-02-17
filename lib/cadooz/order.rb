class Cadooz::Order
  attr_reader :client, :commission, :cost_owner, :cost_unit, :credit_or_number,
              :customer_reference_number, :delivery_address, :generation_profile,
              :greeting_card, :invoice_address, :invoice_information, :language,
              :order_attributes, :order_description, :order_positions, :payment_informations,
              :queue, :send_mail, :test, :website

  def initialize(open_struct)

  end
end