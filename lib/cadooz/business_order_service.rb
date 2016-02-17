class Cadooz::BusinessOrderService
  DEFAULT_TIMEOUT = 10

  def initialize(open_timeout, read_timeout)
    @@client = Savon.client(
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


end