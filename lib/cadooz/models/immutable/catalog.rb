class Cadooz::Immutable::Catalog
  include Mixins

  attr_reader :id, :name, :description, :products

  def initialize(open_struct)
    @id = open_struct&.id
    @name = open_struct&.name
    @description = open_struct&.description
    @products = Array(open_struct&.products)&.each_with_object([]) { |p, arr| arr << Cadooz::Immutable::CatalogProduct.new(p) }

    self.freeze
  end
end