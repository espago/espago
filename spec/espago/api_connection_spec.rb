require "spec_helper"
require "espago/api_connection"
require "json"

class StubbedResponse < Struct.new(:body, :status); end

class Espago::ApiConnection::StubbedPath
  def initialize(connection); end

  def request(params = {})
    StubbedResponse.new("{\"data\":\"returned api data\"}", 200)
  end
end

class Espago::ApiConnection::UnauthorizedPath
  def initialize(connection)
  end

  def request(params = {})
    StubbedResponse.new(nil, 401)
  end
end


describe Espago::ApiConnection do
  subject { Espago::ApiConnection.new("http://some.api.example.com",{'Accept' => "application/vnd.espago.v2+json"}) }

  context "#create" do
    it "returns response" do
      subject.create(:path, :stubbed).should be_a_kind_of Espago::Response
    end
    it "raises auth error" do
      expect { subject.create(:path, :unauthorized) }.to raise_error Espago::AuthenticationError
    end
  end
end
