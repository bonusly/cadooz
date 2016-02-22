class Cadooz::Immutable::GreetingCard
  attr_reader :subject, :text

  def initialize(open_struct)
    @subject = open_struct&.subject
    @text = open_struct&.text

    self.freeze
  end
end