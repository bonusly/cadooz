class Cadooz::OrderPosition
  attr_reader :amount, :attributes, :cadooz_product_number, :currency,
              :delivery_address, :external_reference_number, :greeting_card,
              :value, :voucher_address, :voucher_address_editable,
              :voucher_address_preset

  def initialize(open_struct)
    @amount = open_struct&.amount
    @attributes = open_struct&.attributes&.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @cadooz_product_number = open_struct&.cadooz_product_number
    @currency = open_struct&.currency
    @delivery_address = open_struct&.delivery_address
    @external_reference_number = open_struct&.external_reference_number
    @greeting_card = open_struct&.greeting_card
    @value = open_struct&.value
    @voucher_address = open_struct&.voucher_address
    @voucher_address_editable = open_struct&.voucher_address_editable
    @voucher_address_preset = open_struct&.voucher_address_preset
  end
end