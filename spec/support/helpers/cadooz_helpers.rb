module CadoozHelpers
  RAW_RESPONSES = {
    create_order: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:CreateOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderNumber>160223-066122</orderNumber><orderState>CREATED</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:CreateOrderResponse></soap:Body></soap:Envelope>",
      fail: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:CreateOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderNumber>160223-066122</orderNumber><orderState>ALREADY_PROCESSED</orderState><deliveryState>UNKNOWN</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message>Fehler:  order with external reference number 20000 was already processed! (Ordern Number(s): 160223-066122)</message><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:CreateOrderResponse></soap:Body></soap:Envelope>"
    },
    get_order_status: {

    },
  }

  DUMPED_RESPONSE_OBJECTS = {
      create_order: {
        success: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\fWAITING\x06:\x06ET:\r@message0:\x12@order_numberI\"\x12160223-066122\x06;\aT:\x11@order_stateI\"\fCREATED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0",
        fail: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\fUNKNOWN\x06:\x06ET:\r@messageI\"qFehler:  order with external reference number 20000 was already processed! (Ordern Number(s): 160223-066122)\x06;\aT:\x12@order_numberI\"\x12160223-066122\x06;\aT:\x11@order_stateI\"\x16ALREADY_PROCESSED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0"
      },
      get_order_status: {

      }
  }

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

    order.customer_reference_number = 20000
    order.generation_profile = 'XML Schnittstelle (Test)'
    order.delivery_address = address
    order.order_positions << position

    order
  end

  def get_raw_response(operation, success)
    RAW_RESPONSES[operation][success ? :success : :fail]
  end

  def get_serialized_response_object(operation, success)
    raw = Marshal.load(DUMPED_RESPONSE_OBJECTS[operation][success ? :success : :fail])

    raw.serialize
  end
end