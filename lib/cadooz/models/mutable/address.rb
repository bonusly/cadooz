class Cadooz::Address
  include Mixins

  attr_accessor :city, :company, :country, :department, :email, :firstname,
                :lastname, :phone, :salutation, :state, :street,
                :street_add_on, :zipcode

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
    @street_add_on = nil
    @zipcode = nil
  end
end