class Cadooz::Immutable::Voucher
  include Mixins

  attr_reader :address, :code, :ecard_link, :evoucher_link,
              :pin, :product_name, :product_number,
              :product_variation_number, :serial_number, :value

  def initialize(open_struct)
    @address = Cadooz::Immutable::Address.new(open_struct&.address)
    @code = open_struct&.code
    @currency = open_struct&.currency
    @ecard_link = open_struct&.ecard_link
    @evoucher_link = open_struct&.evoucher_link
    @pin = open_struct&.pin
    @product_name = open_struct&.product_name
    @product_number = open_struct&.product_number
    @product_variation_number = open_struct&.product_variation_number
    @serial_number = open_struct&.serial_number
    @value = open_struct&.value.to_f

    self.freeze
  end
end