class Cadooz::Mutable::Payment
  include ::Mixins

  attr_accessor :attributes, :description, :paid, :type, :value, :verified

  def initialize
    @attributes = nil
    @description = nil
    @paid = nil
    @type = nil
    @value = nil
    @verified = nil
  end
end