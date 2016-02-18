class Cadooz::Address
  attr_accessor :city, :company, :country, :department, :email, :firstname,
                :lastname, :phone, :salutation, :state, :street,
                :street_add_on, :zip_code

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
    @zip_code = nil
  end
end