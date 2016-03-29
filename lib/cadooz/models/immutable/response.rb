class Cadooz::Immutable::Response
  attr_reader :object, :raw

  def initialize(object, raw_response)
    @object = object
    @raw = raw_response

    self.freeze
  end
end