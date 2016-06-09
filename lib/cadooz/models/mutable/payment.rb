class Cadooz::Mutable::Payment
  include ::Mixins

  attr_accessor :attributes, :description, :paid, :type, :value, :verified

  def initialize(args={})
    @attributes = args[:attributes]
    @description = args[:description]
    @paid = args[:paid]
    @type = args[:type]
    @value = args[:value]
    @verified = args[:verified]

    default_value_for_nil
  end
end