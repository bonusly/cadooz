class Cadooz::Immutable::CatalogProductVariation
  include Mixins

  attr_reader :currency, :name, :number, :value

  def initialize(open_struct)
    @currency = open_struct&.currency
    @name = open_struct&.name
    @number = open_struct&.number
    @value = Money.new((open_struct&.value.to_f * 100) || 0, @currency || 'USD')

    self.freeze
  end
end