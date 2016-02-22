class Cadooz::Immutable::Address
  attr_reader :city, :company, :country, :department, :email, :firstname,
              :lastname, :phone, :salutation, :state, :street,
              :street_add_on, :zip_code

  def initialize(open_struct)
    @city = open_struct&.city
    @company =open_struct&.company
    @country = open_struct&.country
    @department = open_struct&.department
    @email = open_struct&.email
    @firstname = open_struct&.firstname
    @lastname = open_struct&.lastname
    @phone = open_struct&.phone
    @salutation = open_struct&.salutation
    @state = open_struct&.state
    @street = open_struct&.street
    @street_add_on = open_struct&.street_add_on
    @zip_code = open_struct&.zipcode

    self.freeze
  end
end