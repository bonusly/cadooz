class Cadooz::Mutable::OrderPosition
  include Mixins

  attr_accessor :amount, :attributes, :cadooz_product_number, :currency,
                :delivery_address, :external_reference_number, :greeting_card,
                :value, :voucher_address, :voucher_address_editable,
                :voucher_address_preset

  def initialize
    @amount = nil
    @attributes = nil
    @cadooz_product_number = nil
    @currency = nil
    @delivery_address = nil
    @external_reference_number = nil
    @greeting_card = nil
    @value = nil
    @voucher_address = nil
    @voucher_address_editable = nil
    @voucher_address_preset = nil
  end
end