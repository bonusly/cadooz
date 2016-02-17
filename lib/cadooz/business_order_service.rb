class Cadooz::BusinessOrderService
  DEFAULT_TIMEOUT = 10

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
  end

  # Returns a list of catalog's for the authenticated user. If an error occurs or the user is not allowed to query any catalog, an empty list will be returned.
  # Parameters:
  # includeExtraContent - If true, then some extra content is not included (like attributes and categories)
  # Returns:
  # A list of all available catalog id's for context-principal or an empty List.
  def get_available_catalogs(include_extra_content)
    @client.call(:get_available_catalogs, message: { include_extra_content: include_extra_content.to_s })
  end

  # Returns a List of ProductCategory objects for CatalogProduct objects or an empty list if an error occurs.
  # Returns:
  # A list of all categories or an empty list.z
  def get_available_categories
    @client.call(:get_available_categories)
  end

  # Returns a list of products that can be used within a order. This is specific for a generation profile and should not be mixed up with the merchant catalog getAvailableCatalogs(boolean).
  # Parameters:
  # generationProfile - a name of a generation profile defined by cadooz
  # Returns:
  # A list of generation profile products that can be used for an order inside createOrder(Order)
  def get_available_products(generation_profile)
    @client.call(:get_available_products, message: { generation_profile: generation_profile })
  end
end