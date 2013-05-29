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

describe Espago::ApiConnection do
  subject { Espago::ApiConnection.new("http://some.api.example.com") }

  context "#create" do
    it "should return response body in json format" do
      subject.create(:path, :stubbed).should eq(JSON.parse("{\"data\":\"returned api data\"}"))
    end
  end
end
