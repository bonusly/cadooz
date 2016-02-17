class Cadooz::Catalog
  attr_reader :id, :name, :description, :products

  def initialize
    @id = nil
    @name = nil
    @description = nil
    @products = []
  end
end