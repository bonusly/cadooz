class Cadooz::GenerationProfileProduct
  attr_reader :cadooz_product_number, :custom_value, :external_product_number, :value

  def initialize(open_struct)
    @cadooz_product_number = open_struct&.cadooz_product_number
    @custom_value = open_struct&.custom_value
    @external_product_number = open_struct&.external_product_number
    @value = open_struct&.value
  end
end