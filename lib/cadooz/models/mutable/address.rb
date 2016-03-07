class Cadooz::Mutable::Address
  include Mixins

  attr_accessor :city, :company, :country, :department, :email, :firstname,
                :lastname, :phone, :salutation, :state, :street,
                :street_addon, :zipcode

  def initialize
    @company = nil
    @country = nil
    @department = nil
    @email = nil
    @firstname = nil
    @lastname = nil
    @phone = nil
    @salutation = nil
    @state = nil
    @street = nil
    @street_addon = nil
    @zipcode = nil
  end
end