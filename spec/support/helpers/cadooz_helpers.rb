module CadoozHelpers
  RAW_RESPONSES = {
    create_order: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:CreateOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderNumber>160223-066122</orderNumber><orderState>CREATED</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:CreateOrderResponse></soap:Body></soap:Envelope>",
      fail: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:CreateOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderNumber>160223-066122</orderNumber><orderState>ALREADY_PROCESSED</orderState><deliveryState>UNKNOWN</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message>Fehler:  order with external reference number 20000 was already processed! (Ordern Number(s): 160223-066122)</message><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:CreateOrderResponse></soap:Body></soap:Envelope>"
    },
    get_order_status: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getOrderStatusResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderState>DELIVERED</orderState><deliveryState>DELIVERED</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:getOrderStatusResponse></soap:Body></soap:Envelope>",
    },
    get_order_status_by_customer_reference_number: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getOrderStatusByCustomerReferenceNumberResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderState>DELIVERED</orderState><deliveryState>DELIVERED</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:getOrderStatusByCustomerReferenceNumberResponse></soap:Body></soap:Envelope>",
    },
    get_changed_orders: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getChangedOrdersResponse xmlns:ns2=\"webservices.cadooz.com\"><return><orderNumber>160223-066085</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-064813</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-066122</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-064653</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-065702</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-064885</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return><return><orderNumber>160223-065853</orderNumber><orderState>WAITING</orderState><deliveryState>WAITING</deliveryState><returnReason xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><packetnumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><shippingProvider xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></return></ns2:getChangedOrdersResponse></soap:Body></soap:Envelope>",
      fail: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getChangedOrdersResponse xmlns:ns2=\"webservices.cadooz.com\"/></soap:Body></soap:Envelope>"
    },
    get_order: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><test>true</test><generationProfile>XML Schnittstelle (Test)</generationProfile><sendMail>false</sendMail><commission>false</commission><client xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><website xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><costUnit xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><costOwner xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><language>EN</language><creditorNumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><customerReferenceNumber>10000</customerReferenceNumber><orderDescription xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><deliveryAddress><salutation>UNKNOWN</salutation><firstname>Homer</firstname><lastname>Simpson</lastname><company>Nuclear Power Plant</company><department>Safety</department><street>100 Industrial Way</street><streetAddon></streetAddon><city>Springfield</city><zipcode>97477</zipcode><state></state><country>US</country><email>homer.simpson@springfieldnuclear.biz</email><phone>(555) 555-5555</phone></deliveryAddress><invoiceAddress><salutation>COMPANY</salutation><firstname></firstname><lastname></lastname><company>Testkunde</company><department>cadooz</department><street>Osterbekstr. 90b</street><streetAddon></streetAddon><city>HAMBURG</city><zipcode>22083</zipcode><state></state><country>DE</country><email>julia.meseke@cadooz.de</email><phone></phone></invoiceAddress><orderPositions><amount>1</amount><cadoozProductNumber>8099</cadoozProductNumber><externalReferenceNumber xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><value>10.00000</value><currency>EUR</currency><deliveryAddress><salutation>UNKNOWN</salutation><firstname>Homer</firstname><lastname>Simpson</lastname><company>Nuclear Power Plant</company><department>Safety</department><street>100 Industrial Way</street><streetAddon></streetAddon><city>Springfield</city><zipcode>97477</zipcode><state></state><country>US</country><email>homer.simpson@springfieldnuclear.biz</email><phone>(555) 555-5555</phone></deliveryAddress><voucherAddress xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><voucherAddressEditable>false</voucherAddressEditable><voucherAddressPreset>false</voucherAddressPreset><greetingCard xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/></orderPositions><greetingCard xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><queue>false</queue></return></ns2:getOrderResponse></soap:Body></soap:Envelope>",
      fail: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getOrderResponse xmlns:ns2=\"webservices.cadooz.com\"/></soap:Body></soap:Envelope>"
    },
    get_available_catalogs: {
      success: File.read('./spec/support/getAvailableCatalogs.xml')
    },
    get_available_categories: {
      success: File.read('./spec/support/getAvailableCategories.xml')
    },
    get_available_products: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getAvailableProductsResponse xmlns:ns2=\"webservices.cadooz.com\"><return><cadoozProductNumber>8099</cadoozProductNumber><externalProductNumber>BC</externalProductNumber><value xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><customValue>true</customValue></return><return><cadoozProductNumber>8099</cadoozProductNumber><externalProductNumber>8099</externalProductNumber><value xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:nil=\"true\"/><customValue>true</customValue></return></ns2:getAvailableProductsResponse></soap:Body></soap:Envelope>"
    },
    get_vouchers_for_order: {
      success: "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><ns2:getVouchersForOrderResponse xmlns:ns2=\"webservices.cadooz.com\"><return><responseState>SUCCESS</responseState></return></ns2:getVouchersForOrderResponse></soap:Body></soap:Envelope>"
    }
  }

  DUMPED_RESPONSE_OBJECTS = {
      create_order: {
        success: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\fWAITING\x06:\x06ET:\r@message0:\x12@order_numberI\"\x12160223-066122\x06;\aT:\x11@order_stateI\"\fCREATED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0",
        fail: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\fUNKNOWN\x06:\x06ET:\r@messageI\"qFehler:  order with external reference number 20000 was already processed! (Ordern Number(s): 160223-066122)\x06;\aT:\x12@order_numberI\"\x12160223-066122\x06;\aT:\x11@order_stateI\"\x16ALREADY_PROCESSED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0"
      },
      get_order_status: {
        success: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\x0EDELIVERED\x06:\x06ET:\r@message0:\x12@order_number0:\x11@order_stateI\"\x0EDELIVERED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0",
      },
      get_order_status_by_customer_reference_number: {
        success: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\x0EDELIVERED\x06:\x06ET:\r@message0:\x12@order_number0:\x11@order_stateI\"\x0EDELIVERED\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0"
      },
      get_changed_orders: {
        success: "\x04\b[\fo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_stateI\"\fWAITING\x06:\x06ET:\r@message0:\x12@order_numberI\"\x12160223-066085\x06;\aT:\x11@order_stateI\"\fWAITING\x06;\aT:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-064813\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-066122\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-064653\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-065702\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-064885\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0o;\x00\f;\x06I\"\fWAITING\x06;\aT;\b0;\tI\"\x12160223-065853\x06;\aT;\nI\"\fWAITING\x06;\aT;\v0;\f0;\r0",
        fail: "\x04\bo:#Cadooz::Immutable::OrderStatus\f:\x14@delivery_state0:\r@message0:\x12@order_number0:\x11@order_state0:\x13@packet_number0:\x13@return_reason0:\x17@shipping_provider0"
      },
      get_order: {
        success: "\x04\bo:\x1DCadooz::Immutable::Order\x19:\f@client0:\x10@commissionF:\x10@cost_owner0:\x0F@cost_unit0:\x16@credit_or_number0:\x1F@customer_reference_numberI\"\n10000\x06:\x06ET:\x16@delivery_addresso:\x1FCadooz::Immutable::Address\x12:\n@cityI\"\x10Springfield\x06;\fT:\r@companyI\"\x18Nuclear Power Plant\x06;\fT:\r@countryI\"\aUS\x06;\fT:\x10@departmentI\"\vSafety\x06;\fT:\v@emailI\")homer.simpson@springfieldnuclear.biz\x06;\fT:\x0F@firstnameI\"\nHomer\x06;\fT:\x0E@lastnameI\"\fSimpson\x06;\fT:\v@phoneI\"\x13(555) 555-5555\x06;\fT:\x10@salutationI\"\fUNKNOWN\x06;\fT:\v@state0:\f@streetI\"\x17100 Industrial Way\x06;\fT:\x13@street_add_on0:\x0E@zip_codeI\"\n97477\x06;\fT:\x18@generation_profileI\"\x1DXML Schnittstelle (Test)\x06;\fT:\x13@greeting_cardo:$Cadooz::Immutable::GreetingCard\a:\r@subject0:\n@text0:\x15@invoice_addresso;\x0E\x12;\x0FI\"\fHAMBURG\x06;\fT;\x10I\"\x0ETestkunde\x06;\fT;\x11I\"\aDE\x06;\fT;\x12I\"\vcadooz\x06;\fT;\x13I\"\ejulia.meseke@cadooz.de\x06;\fT;\x140;\x150;\x160;\x17I\"\fCOMPANY\x06;\fT;\x180;\x19I\"\x15Osterbekstr. 90b\x06;\fT;\x1A0;\eI\"\n22083\x06;\fT:\x19@invoice_information[\x00:\x0E@languageI\"\aEN\x06;\fT:\x16@order_attributes0:\x17@order_description0:\x15@order_positions[\x06o:%Cadooz::Immutable::OrderPosition\x10:\f@amountI\"\x061\x06;\fT:\x10@attributes0:\e@cadooz_product_numberI\"\t8099\x06;\fT:\x0E@currencyI\"\bEUR\x06;\fT;\rU:\x0FOpenStruct{\x12:\x0FsalutationI\"\fUNKNOWN\x06;\fT:\x0EfirstnameI\"\nHomer\x06;\fT:\rlastnameI\"\fSimpson\x06;\fT:\fcompanyI\"\x18Nuclear Power Plant\x06;\fT:\x0FdepartmentI\"\vSafety\x06;\fT:\vstreetI\"\x17100 Industrial Way\x06;\fT:\x11street_addon0:\tcityI\"\x10Springfield\x06;\fT:\fzipcodeI\"\n97477\x06;\fT:\nstate0:\fcountryI\"\aUS\x06;\fT:\nemailI\")homer.simpson@springfieldnuclear.biz\x06;\fT:\nphoneI\"\x13(555) 555-5555\x06;\fT:\x1F@external_reference_number0;\x1D0:\v@valueI\"\r10.00000\x06;\fT:\x15@voucher_address0:\x1E@voucher_address_editableF:\x1C@voucher_address_presetF:\x1A@payment_informations0:\v@queueF:\x0F@send_mailF:\n@testT:\r@website0",
        fail: "\x04\bo:\x1DCadooz::Immutable::Order\x19:\f@client0:\x10@commission0:\x10@cost_owner0:\x0F@cost_unit0:\x16@credit_or_number0:\x1F@customer_reference_number0:\x16@delivery_addresso:\x1FCadooz::Immutable::Address\x12:\n@city0:\r@company0:\r@country0:\x10@department0:\v@email0:\x0F@firstname0:\x0E@lastname0:\v@phone0:\x10@salutation0:\v@state0:\f@street0:\x13@street_add_on0:\x0E@zip_code0:\x18@generation_profile0:\x13@greeting_cardo:$Cadooz::Immutable::GreetingCard\a:\r@subject0:\n@text0:\x15@invoice_addresso;\r\x12;\x0E0;\x0F0;\x100;\x110;\x120;\x130;\x140;\x150;\x160;\x170;\x180;\x190;\x1A0:\x19@invoice_information[\x00:\x0E@language0:\x16@order_attributes0:\x17@order_description0:\x15@order_positions[\x00:\x1A@payment_informations0:\v@queue0:\x0F@send_mail0:\n@test0:\r@website0"
      },
      get_available_catalogs: {
        success: File.read('./spec/support/getAvailableCatalogs.txt')
      },
      get_available_categories: {
        success: File.read('./spec/support/getAvailableCategories.txt')
      },
      get_available_products: {
        success: "\x04\b[\ao:0Cadooz::Immutable::GenerationProfileProduct\t:\e@cadooz_product_numberI\"\t8099\x06:\x06ET:\x12@custom_valueT:\x1D@external_product_numberI\"\aBC\x06;\aT:\v@value0o;\x00\t;\x06I\"\t8099\x06;\aT;\bT;\tI\"\t8099\x06;\aT;\n0"
      },
      get_vouchers_for_order: {
        success: "\x04\bo:\x1FCadooz::Immutable::Voucher\x10:\r@addresso:\x1FCadooz::Immutable::Address\x12:\n@city0:\r@company0:\r@country0:\x10@department0:\v@email0:\x0F@firstname0:\x0E@lastname0:\v@phone0:\x10@salutation0:\v@state0:\f@street0:\x13@street_add_on0:\x0E@zip_code0:\n@code0:\x0E@currency0:\x10@ecard_link0:\x13@evoucher_link0:\t@pin0:\x12@product_name0:\x14@product_number0:\x1E@product_variation_number0:\x13@serial_number0:\v@valueo:\nMoney\b:\x10@fractionalu:\x0FBigDecimal\v18:0.0;\x16o:\x14Money::Currency\x14:\b@id:\busd:\x17@alternate_symbols[\x06I\"\bUS$\x06:\x06ET:\x12@decimal_markI\"\x06.\x06;&T:\x19@disambiguate_symbol0:\x11@html_entityI\"\x06$\x06;&T:\x0E@iso_codeI\"\bUSD\x06;&T:\x11@iso_numericI\"\b840\x06;&T:\n@nameI\"\x19United States Dollar\x06;&T:\x0E@priorityi\x06:\e@smallest_denominationi\x06:\r@subunitI\"\tCent\x06;&T:\x15@subunit_to_unitii:\f@symbolI\"\x06$\x06;&T:\x12@symbol_firstT:\x19@thousands_separatorI\"\x06,\x06;&T:\n@bankU:\"Money::Bank::VariableExchange[\a[\bc\x1EMoney::RatesStore::Memory{\x00{\x000"
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

    raw.class == Array ? raw.map(&:serialize) : raw.serialize
  end
end