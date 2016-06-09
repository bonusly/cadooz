class Cadooz::Mutable::Address
  include Mixins

  attr_accessor :city, :company, :country, :department, :email, :firstname,
                :lastname, :phone, :salutation, :state, :street,
                :street_addon, :zipcode

  def initialize(args={})
    @company = args[:company]
    @country = args[:country]
    @department = args[:department]
    @email = args[:email]
    @firstname = args[:firstname]
    @lastname = args[:lastname]
    @phone = args[:phone]
    @salutation = args[:salutation]
    @state = args[:state]
    @street = args[:street]
    @street_addon = street_addon
    @zipcode = args[:zipcode]

    default_value_for_nil
  end
end