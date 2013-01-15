require 'spec_helper'
require 'espago/client'

class StubbedApiRequest
  def create(method, params)
    'returned api data'
  end
end


describe Espago::Client do
  subject { Espago::Client.new(pub_key: 'public_key', app_id: 'App12345', request: stubbed_api_request) }
  let(:stubbed_api_request) { StubbedApiRequest.new }

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
        subject.send_request(method, params).should eq('returned api data')
      end
    end
  end
end
