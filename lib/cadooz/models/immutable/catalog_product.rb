class Cadooz::CatalogProduct
  attr_reader :attributes, :categories, :mobile_shippable, :name, :number, :offline_shippable, :online_shippable, :type, :variations

  def initialize(open_struct)
    @attributes = open_struct&.attributes&.each_with_object([]) { |a, arr| arr << Cadooz::Attributes.new(a) }
    @categories = open_struct&.categories&.each_with_object([]) { |c, arr| arr << Cadooz::ProductCategory.new(c) }
    @mobile_shippable = open_struct&.mobile_shippable
    @name = open_struct&.name
    @number = open_struct&.number
    @offline_shippable = open_struct&.offline_shippable
    @online_shippable = open_struct&.online_shippable
    @type = open_struct&.type
    @variations = open_struct&.variations&.each_with_object([]) { |v, arr| arr << Cadooz::CatalogProductVariation.new(v) }
  end
end