module CadoozHelpers
  def create_order_param
    order = Cadooz::Mutable::Order.new
    address = Cadooz::Mutable::Address.new
    position = Cadooz::Mutable::OrderPosition.new

    address.city = 'Springfield'
    address.company = 'Nuclear Power Plant'
    address.country = 'US'
    address.department = 'Safety'
    address.email = 'homer.simpson@springfieldnuclear.biz'
    address.firstname = 'Homer'
    address.lastname = 'Simpson'
    address.phone = '(555) 555-5555'
    address.salutation = 'Mr.'
    address.state = 'OR'
    address.street = '100 Industrial Way'
    address.zipcode = 97477

    position.amount = 1
    position.cadooz_product_number = 8099
    position.currency = 'EUR'
    position.value = 10

    order.customer_reference_number = 1
    order.generation_profile = 'XML Schnittstelle (Test)'
    order.delivery_address = address
    order.order_positions << position

    order
  end

  def sample_create_order_response(success)

  end
end