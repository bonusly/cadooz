class Cadooz::Payment
  attr_reader :attributes, :description, :paid, :type, :value, :verified

  def initialize(open_struct)
    @attributes = open_struct&.attributes
                             &.map_entries
                             &.elements
                             &.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @description = open_struct&.description
    @paid = open_struct&.paid
    @type = open_struct&.type
    @value = open_struct&.value
    @verified = open_struct&.verified
  end
end