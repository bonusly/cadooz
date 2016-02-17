class Cadooz::Catalog
  attr_reader :id, :name, :description, :products

  def initialize(open_struct)
    @id = open_struct&.id
    @name = open_struct&.name
    @description = open_struct&.description
    @products = open_struct&.products
  end
end