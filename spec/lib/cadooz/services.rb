require 'spec_helper'

describe Cadooz::BusinessOrderService do
  include CadoozHelpers, Savon::SpecHelper

  before(:all) { savon.mock! }
  after(:all) { savon.unmock! }

  before(:each) do
    wsdl = File.read('./spec/support/BusinessOrderService.wsdl')
    stub_request(:get, /wsdl/).to_return(:status => 200, :body => wsdl)
  end

  describe "instance methods" do
    let(:service) { Cadooz::BusinessOrderService.new }

    describe "create order" do
      let(:order) { create_order_param }

      context "succeeds" do
        let(:raw_response) { get_raw_response(:create_order, true) }
        let(:response) { get_serialized_response_object(:create_order, true) }

        it "should create the order" do
          message = order.serialize

          savon.expects(:create_order).with(message: message).returns(raw_response)

          expect(service.create_order(order).serialize).to eq(response)
        end
      end

      context "fails" do
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