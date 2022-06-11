require 'spec_helper'
require 'espago/client'
require "helpers/fake_response"

class StubbedApiConnection
  def initialize(enviroment,headers); end
  def authenticate(app_id, app_password); end
  def create(path, method, params= {})
    'returned api data'
  end
end

describe Espago::Client do
  subject { Espago::Client.new( app_id: 'app_id_test', app_password: 'secret', connection: stubbed_api_connection, api_version: 2) }
  let(:stubbed_api_connection) { StubbedApiConnection }
  let(:response) { FakeResponse.new(200, {id: 1, status: "2012"}.to_json) }

  it { expect(subject).to respond_to :app_id }
  it { expect(subject).to respond_to :app_password }
  it { expect(subject).to respond_to :public_key }
  it { expect(subject).to respond_to :api_version }

  context "#send_request" do
    let(:method) { :get }
    let(:path) { :new_client }
    let(:params) { { name: "Jan Kowalski"} }

    it "should create an api request" do
      expect(subject.send_request(path, method, params)).to eq('returned api data')
    end

    context "with no credentials" do
      subject { Espago::Client.new }

      it "should raise error" do
        expect { subject.send_request(path, method, params)}.to raise_error(Espago::Client::NotAuthenticated)
      end
    end
  end

  context "#send_request_with_app_id_and_password" do
    subject { Espago::Client.new(connection: stubbed_api_connection, api_version: 2) }
    let(:method) { :get }
    let(:path) { :new_client }
    let(:params) { { name: "Jan Kowalski", app_id: 'app_id_test', app_password: 'secret'} }

    it "should create an api request" do
      expect(subject.send_request(path, method, params)).to eq('returned api data')
    end

  end

  context "#parse_response" do
    subject { Espago::Client.new }

    it "should delegate work to parser" do
      expect(Espago::Response).to receive(:new).with(response)
      subject.parse_response(response)
    end

    it "should parse response into object" do
      expect(subject.parse_response(response).class).to eq(Espago::Response)
    end
  end

end
