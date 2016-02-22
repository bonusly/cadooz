require 'spec_helper'

describe Cadooz::BusinessOrderService do
  include CadoozHelpers

  let(:order) { create_order_param }

  describe "instance methods" do
    describe "create order" do
      context "succeeds" do
        let(:response) { sample_create_order_response(true) }

        before do
          double(Cadooz::BusinessOrderService).create_order(order) { response }
        end

        it "should create the order" do
          double(Cadooz::Immutable::Order).new(response) { true }
        end
      end

      context "fails" do
        let(:response) { sample_create_order_response(false) }

        before do
          double(Cadooz::BusinessOrderService).create_order(order) { response }
        end

        # it "should throw an exception"
        #   # TODO
        # end
      end
    end

    describe "get order status" do

    end

    describe "get order status by customer reference number" do

    end

    describe "get changed orders" do

    end

    describe "get order" do

    end

    describe "get available catalogs" do

    end

    describe "get product informations" do

    end

    describe "get available categories" do

    end

    describe "get available products" do

    end

    describe "get vouchers for order" do

    end
  end
end