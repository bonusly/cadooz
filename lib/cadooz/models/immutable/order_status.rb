class Cadooz::Immutable::OrderStatus
  attr_reader :delivery_state, :message, :order_number, :order_state,
              :packet_number, :return_reason, :shipping_provider

  def initialize(open_struct)
    @delivery_state = open_struct&.delivery_state
    @message = open_struct&.message
    @order_number = open_struct&.order_number
    @order_state = open_struct&.order_state
    @packet_number = open_struct&.packet_number
    @return_reason = open_struct&.return_reason
    @shipping_provider = open_struct&.shipping_provider

    self.freeze
  end
end