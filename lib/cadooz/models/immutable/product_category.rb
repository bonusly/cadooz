class Cadooz::Immutable::ProductCategory
  include Mixins

  attr_reader :id, :description, :internal_name, :shop_name

  def initialize(open_struct)
    @id = open_struct&.id
    @description = open_struct&.description
                              &.map_entries
                              &.elements
                              &.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @internal_name = open_struct&.internal_name
    @shop_name = open_struct&.shop_name
                            &.map_entries
                            &.elements
                            &.inject({}) { |hash, element| hash.merge(element.key.to_sym => element.value) }

    self.freeze
  end
end