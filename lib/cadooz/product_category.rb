class Cadooz::ProductCategory
  attr_reader :id, :description, :internal_name, :shop_name

  def initialize(hash)
    @id = nil
    @description = nil
    @internal_name = nil
    @shop_name = {}
  end
end