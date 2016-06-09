class Cadooz::Mutable::OrderPosition
  include Mixins

  attr_accessor :amount, :attributes, :cadooz_product_number, :currency,
                :delivery_address, :external_reference_number, :greeting_card,
                :value, :voucher_address, :voucher_address_editable,
                :voucher_address_preset

  def initialize(args={})
    @amount = args[:amount]
    @attributes = args[:attributes]
    @cadooz_product_number = args[:cadooz_product_number]
    @currency = args[:currency]
    @delivery_address = args[:delivery_address]
    @external_reference_number = args[:external_reference_number]
    @greeting_card = args[:greeting_card]
    @value = args[:value]
    @voucher_address = args[:voucher_address]
    @voucher_address_editable = args[:voucher_address_editable]
    @voucher_address_preset = args[:voucher_address_preset]

    default_value_for_nil
  end
end