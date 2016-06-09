class Cadooz::Mutable::GreetingCard
  include Mixins

  attr_accessor :subject, :text

  def initialize(args={})
    @subject = args[:subject]
    @text = args[:text]

    default_value_for_nil
  end
end