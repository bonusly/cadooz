class Cadooz::GreetingCard
  include Mixins

  attr_accessor :subject, :text

  def initialize
    @subject = nil
    @text = nil
  end
end