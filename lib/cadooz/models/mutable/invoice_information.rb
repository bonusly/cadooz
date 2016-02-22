class Cadooz::Mutable::InvoiceInformation
  include Mixins

  attr_accessor :debitor_number, :value

  def initialize
    @debitor_number = nil
    @value = nil
  end
end