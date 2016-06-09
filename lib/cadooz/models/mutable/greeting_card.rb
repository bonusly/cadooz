class Cadooz::Mutable::GreetingCard
  include Mixins

  attr_accessor :subject, :text

  def initialize
    @subject = nil
    @text = nil

    default_value_for_nil
  end
end