require 'spec_helper'
require 'espago/client'

class ApiRequest; end

describe Espago::Client do
  subject { Espago::Client.new(pub_key: 'public_key', app_id: 'App12345') }

  context "#initialize" do
    context "with valid params" do
      its(:public_key) { should_not be_empty }
      its(:app_id) { should_not be_empty }
    end

    context "with invalid params" do
      it "should raise an error if public_key empty" do
        expect { Espago::Client.new }.to raise_error
      end
    end

    context "#send_request" do
      let(:method) { :new_client }
      let(:params) { { name: "Jan Kowalski"} }

      it "should create an api request" do
        request = stub(:create)
        ApiRequest.stub(:new) { request }
        request.should_receive(:create).with(method, params)
        subject.send_request(method, params)
      end
    end
  end
end
