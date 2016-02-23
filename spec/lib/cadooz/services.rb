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

          # Comparing serialize hash responses easiest way to test value equality
          savon.expects(:create_order).with(message: message).returns(raw_response)
          expect(service.create_order(order).serialize).to eq(response)
        end
      end

      context "fails" do
        let(:raw_response) { get_raw_response(:create_order, false) }
        let(:response) { get_serialized_response_object(:create_order, false) }

        it "should not create the order" do
          message = order.serialize

          savon.expects(:create_order).with(message: message).returns(raw_response)
          expect(service.create_order(order).serialize).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          message = { garbage: 'trash' }
          expect { service.create_order(message).serialize }.to raise_error(NoMethodError)
        end
      end
    end

    describe "get order status" do
      # Endpoint always returns same 'DELIVERED' response in sandbox as long as
      # expected parameters are passed. Thus, 'fails' context is skipped
      let(:raw_response) { get_raw_response(:get_order_status, true) }
      let(:response) { get_serialized_response_object(:get_order_status, true) }

      context "succeeds" do
        it "should get the order status" do
          message = { order_number: 20000 }

          savon.expects(:get_order_status).with(message: message).returns(raw_response)
          expect(service.get_order_status(20000).serialize).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          message = { garbage: 'trash' }

          savon.expects(:get_order_status).with(message: message).returns(raw_response)
          expect { service.get_order_status(message).serialize }.to raise_error(Savon::ExpectationError)
        end
      end
    end

    describe "get order status by customer reference number" do
      # Endpoint always returns same 'DELIVERED' response in sandbox as long as
      # expected parameters are passed. Thus, 'fails' context is skipped
      let(:raw_response) { get_raw_response(:get_order_status_by_customer_reference_number, true) }
      let(:response) { get_serialized_response_object(:get_order_status_by_customer_reference_number, true) }

      context "succeeds" do
        it "should get the order status" do
          message = { customer_reference_number: 20000 }

          savon.expects(:get_order_status_by_customer_reference_number).with(message: message).returns(raw_response)
          expect(service.get_order_status_by_customer_reference_number(20000).serialize).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          message = { garbage: 'trash' }

          savon.expects(:get_order_status_by_customer_reference_number).with(message: message).returns(raw_response)
          expect { service.get_order_status_by_customer_reference_number(message).serialize }.to raise_error(Savon::ExpectationError)
        end
      end
    end

    describe "get changed orders" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_changed_orders, true) }
        let(:response) { get_serialized_response_object(:get_changed_orders, true) }

        it "should get changed orders" do
          # Past time
          message = { last_check_time: Date.parse('20-02-2016') }

          savon.expects(:get_changed_orders).with(message: message).returns(raw_response)
          expect(service.get_changed_orders(Date.parse('20-02-2016')).map(&:serialize)).to eq(response)
        end
      end

      context "fails" do
        let(:raw_response) { get_raw_response(:get_changed_orders, false) }
        let(:response) { get_serialized_response_object(:get_changed_orders, false) }

        it "should return an empty response" do
          # Future time
          message = { last_check_time: Date.parse('01-03-2016') }

          savon.expects(:get_changed_orders).with(message: message).returns(raw_response)
          expect(service.get_changed_orders(Date.parse('01-03-2016')).serialize).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          # Revisit with VCR recording of failed request
        end
      end
    end

    describe "get order" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_order, true) }
        let (:response) { get_serialized_response_object(:get_order, true) }

        it "should get the order" do
          message = { order_number: '160223-066085' }

          savon.expects(:get_order).with(message: message).returns(raw_response)
          expect(service.get_order('160223-066085').serialize).to eq(response)
        end
      end

      context "fails" do
        let(:raw_response) { get_raw_response(:get_order, false) }
        let (:response) { get_serialized_response_object(:get_order, false) }

        it "should return an empty response" do
          message = { order_number: '9' }

          savon.expects(:get_order).with(message: message).returns(raw_response)
          expect(service.get_order('9').serialize).to eq(response)
        end
      end
    end

    describe "get available catalogs" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_available_catalogs, true) }
        let(:response) { get_serialized_response_object(:get_available_catalogs, true) }

        it "should get the available catalogs" do
          message = { include_extra_content: false }

          savon.expects(:get_available_catalogs).with(message: message).returns(raw_response)
          expect(service.get_available_catalogs.serialize).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          # Revisit with VCR recording of failed request
        end
      end
    end

    describe "get available categories" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_available_categories, true) }
        let(:response) { get_serialized_response_object(:get_available_categories, true) }

        it "should get available categories" do
          savon.expects(:get_available_categories).returns(raw_response)
          expect(service.get_available_categories.map(&:serialize)).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          # Revisit with VCR recording of failed request
        end
      end
    end

    describe "get available products" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_available_products, true) }
        let(:response) { get_serialized_response_object(:get_available_products, true) }

        it "should get available products" do
          message = { generation_profile: 'XML Schnittstelle (Test)' }

          savon.expects(:get_available_products).with(message: message).returns(raw_response)
          expect(service.get_available_products.map(&:serialize)).to eq(response)
        end
      end

      context "invalid" do
        it "should raise an exception" do
          # Revisit with VCR recording of failed request
        end
      end
    end

    describe "get vouchers for order" do
      context "succeeds" do
        let(:raw_response) { get_raw_response(:get_vouchers_for_order, true) }
        let(:response) { get_serialized_response_object(:get_vouchers_for_order, true) }

        it "should get vouchers for an order number" do
          message = { generation_profile_name: 'XML Schnittstelle (Test)', order_number: '160223-066085' }

          savon.expects(:get_vouchers_for_order).with(message: message).returns(raw_response)
          expect(service.get_vouchers_for_order('160223-066085').serialize).to eq(response)
        end
      end

      context "invalid" do
        # Revisit with VCR recording of failed request
      end
    end
  end
end