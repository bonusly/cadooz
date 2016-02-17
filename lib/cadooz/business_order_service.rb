class Cadooz::BusinessOrderService
  DEFAULT_TIMEOUT = 10
  DEFAULT_GENERATION_PROFILE = 'XML Schnittstelle (Test)'

  def initialize(open_timeout, read_timeout)
    @client = Savon.client(
      wsdl: Cadooz.configuration.wsdl,
      basic_auth: [
          Cadooz.configuration.username,
          Cadooz.configuration.password
      ],
      headers: { 'SOAPAction' => '' },
      open_timeout: open_timeout || DEFAULT_TIMEOUT,
      read_timeout: read_timeout || DEFAULT_TIMEOUT
    )

    @call = -> o, m { m ? @client.call(o, message: m) : @client.call(o) }
  end

  # Returns a list of catalog's for the authenticated user. If an error occurs or the user is not allowed to query any catalog, an empty list will be returned.
  # Parameters:
  # includeExtraContent - If true, then some extra content is not included (like attributes and categories)
  # Returns:
  # A list of all available catalog id's for context-principal or an empty List.
  def get_available_catalogs(include_extra_content = false)
    response_class = Cadooz::Catalog

    deserialize(@call.(__callee__, {include_extra_content: include_extra_content }), response_class, __callee__)
  end

  # Returns a List of ProductCategory objects for CatalogProduct objects or an empty list if an error occurs.
  # Returns:
  # A list of all categories or an empty list.z
  def get_available_categories
    response_class = Cadooz::ProductCategory

    deserialize(@call.(__callee__, nil), response_class, __callee__)
  end

  # Returns a list of products that can be used within a order. This is specific for a generation profile and should not be mixed up with the merchant catalog getAvailableCatalogs(boolean).
  # Parameters:
  # generationProfile - a name of a generation profile defined by cadooz
  # Returns:
  # A list of generation profile products that can be used for an order inside createOrder(Order)
  def get_available_products(generation_profile = DEFAULT_GENERATION_PROFILE)
    response_class = Cadooz::GenerationProfileProduct

    deserialize(@call.(__callee__, {generation_profile: generation_profile }), response_class, __callee__)
  end

  private

  def deserialize(response, response_class, operation)
    key = (operation.to_s + '_response').to_sym
    body = response.body[key][:return]

    object = JSON.parse(body.to_json, object_class: OpenStruct)

    if object.class == Array
      object.each_with_object([]) { |o, arr| arr << Object::const_get(response_class.to_s).new(o) }
    elsif object.class == Hash
      Object::const_get(response_class.to_s).new(object)
    else
      # TODO handle exception
    end
  end
end