class Cadooz::Attributes
  attr_reader :attribute, :values

  def initialize(open_struct)
    @attribute = open_struct&.attribute
    @values = open_struct&.values
                         &.map_entries
                         &.elements
                         &.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
  end
end