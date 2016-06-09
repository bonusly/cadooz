class Cadooz::Mutable::InvoiceInformation
  include Mixins

  attr_accessor :debitor_number, :value

  def initialize(args={})
    @debitor_number = args[:debitor_number]
    @value = args[:value]

    default_value_for_nil
  end
end