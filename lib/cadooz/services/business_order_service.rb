class Cadooz::BusinessOrderService
  DEFAULT_TIMEOUT = 10

  def initialize(open_timeout = DEFAULT_TIMEOUT, read_timeout = DEFAULT_TIMEOUT)
    @client = Savon.client(
      wsdl: Cadooz.configuration.wsdl,
      basic_auth: [
          Cadooz.configuration.username,
          Cadooz.configuration.password
      ],
      headers: { 'SOAPAction' => '' },
      open_timeout: open_timeout,
      read_timeout: read_timeout
    )

    @call = -> o, m { m ? @client.call(o, message: m) : @client.call(o) }
  end

  # Creates an order in the cadooz system based on the information given in Order. You should always create an order with a given customer reference number to avoid multiple orders of on order. The customer reference number should be unique over all your orders you do and you should save it on your site.
  # Returns:
  # The order result object contains informations about the created order.
  #
  ### IMPORTANT ###
  # The minimum set of information that is needed in the Order object is a unique customer_reference_number, a delivery_address and a product_number.
  #################
  def create_order(order)
    response_class = Cadooz::Immutable::OrderStatus

    deserialize(@call.(__callee__, order.serialize), response_class, __callee__)
  end

  # Returns informations about an order.
  # Returns:
  # The order result object contains informations about the created order.
  def get_order_status(order_number)
    response_class = Cadooz::Immutable::OrderStatus

    deserialize(@call.(__callee__, {order_number: order_number}), response_class, __callee__)
  end

  # Returns informations about an order based on the customer order reference number given during createOrder(Order) in the field CustomerReferenceNumber.
  # Returns:
  # The order result object contains informations about the created order.
  def get_order_status_by_customer_reference_number(customer_reference_number)
    response_class = Cadooz::Immutable::OrderStatus

    deserialize(@call.(__callee__, {customer_reference_number: customer_reference_number}), response_class, __callee__)
  end

  # Returns informations about changes in one of the created order since the lastCheckTime. You should use this task to get changes in orders. Use the lastCheckTime to reduce the data size and the response time for the needed informations. For example: You have created an order on 01.01.2013. In the best situation you will get between 1-3 days later new change states because the order is delivered. If the order returns after a week, you will receive a new change state. Be aware, that you store your "lastCheckTime" on first request and use it next time. All changes since that time are returned.
  # Returns:
  # A list of of order result object containing informations about changed orders.
  def get_changed_orders(last_check_time)
    response_class = Cadooz::Immutable::OrderStatus

    deserialize(@call.(__callee__, {last_check_time: last_check_time}), response_class, __callee__)
  end

  # Order getOrder(java.lang.String orderNumber)
  # Returns all known data about an order identified by the cadooz order number. Be aware that not all information that we received (invoice informations etc) can be returned. Only the "necessary" informations like what is orders are stored on the order number.
  # Returns:
  # The order object or null if no order was found.
  def get_order(order_number)
    response_class = Cadooz::Immutable::Order

    deserialize(@call.(__callee__, {order_number: order_number}), response_class, __callee__)
  end

  # Returns a list of catalog's for the authenticated user. If an error occurs or the user is not allowed to query any catalog, an empty list will be returned.
  # Parameters:
  # includeExtraContent - If true, then some extra content is not included (like attributes and categories)
  # Returns:
  # A list of all available catalog id's for context-principal or an empty List.
  def get_available_catalogs(include_extra_content = false)
    response_class = Cadooz::Immutable::Catalog

    deserialize(@call.(__callee__, {include_extra_content: include_extra_content }), response_class, __callee__)
  end

  # Returns a List of ProductCategory models for CatalogProduct models or an empty list if an error occurs.
  # Returns:
  # A list of all categories or an empty list.z
  def get_available_categories
    response_class = Cadooz::Immutable::ProductCategory

    deserialize(@call.(__callee__, nil), response_class, __callee__)
  end

  # Returns a list of products that can be used within a order. This is specific for a generation profile and should not be mixed up with the merchant catalog getAvailableCatalogs(boolean).
  # Parameters:
  # generationProfile - a name of a generation profile defined by cadooz
  # Returns:
  # A list of generation profile products that can be used for an order inside createOrder(Order)
  def get_available_products(generation_profile = DEFAULT_GENERATION_PROFILE)
    response_class = Cadooz::Immutable::GenerationProfileProduct

    deserialize(@call.(__callee__, {generation_profile: generation_profile }), response_class, __callee__)
  end

  # Returns a VoucherInformation Object. The status of the response can be determined using the method VoucherInformation.getResponseState().
  # If one of the passed arguments is empty the status will be VoucherInformationState.INCORRECT_USAGE.
  # If passed name of the generation profile is unknown the status will be VoucherInformationState.UNKNOWN_GENERAION_PROFILE.
  # If passed order number is not existent or does not match the generation profile name or the authenticated user is not allow to query the order informations the status will be VoucherInformationState.ORDER_NOT_FOUND.
  # Successful queries will have the status VoucherInformationState.SUCCESS.
  # Parameters:
  # generationProfileName - The name of the generation profile used to create the order.
  # orderNumber - The number of the order.
  # Returns:
  # A VoucherInformation object. Never null.
  def get_vouchers_for_order(generation_profile_name = Cadooz.configuration.generation_profile, order_number)
    response_class = Cadooz::Immutable::Voucher

    deserialize(@call.(__callee__, {generation_profile_name: generation_profile_name, order_number: order_number }), response_class, __callee__)
  end

  private

  def deserialize(response, response_class, operation)
    key = (operation.to_s + '_response').to_sym
    body = response.body[key][:return]

    if body.blank?
      object = OpenStruct.new
    else
      object = JSON.parse(body.to_json, object_class: OpenStruct)
    end

    if object.class == Array
      object.each_with_object([]) { |o, arr| arr << Object::const_get(response_class.to_s).new(o) }
    elsif object.class == OpenStruct
      Object::const_get(response_class.to_s).new(object)
    else
      # TODO handle exception
    end
  end
end