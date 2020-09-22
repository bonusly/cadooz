class Cadooz::Immutable::Response
  include Mixins

  attr_reader :object, :raw

  def initialize(object, raw_response)
    @object = object
    @raw = raw_response

    self.freeze
  end
end
