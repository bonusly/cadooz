class Cadooz::InvoiceInformation
  attr_reader :debitor_number, :value

  def initialize(open_struct)
    @debitor_number = open_struct&.debitor_number
    @value = open_struct&.value
  end
end