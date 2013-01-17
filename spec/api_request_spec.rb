require "spec_helper"
require "espago/api_request"
require "json"

class StubbedResponse < Struct.new(:body); end

class Espago::ApiRequest::StubbedPath
  def initialize(connection); end

  def request(params = {})
    StubbedResponse.new("{\"data\":\"returned api data\"}")
  end
end

describe Espago::ApiRequest do

  context "#create" do
    it "should return response body in json format" do
      subject.create(:path, :stubbed).should eq(JSON.parse("{\"data\":\"returned api data\"}"))
    end

    it "should raise an error if path not found" do
      expect { subject.create(:fake, :class) }.to raise_error(Espago::ApiRequest::NoPathError)
    end
  end
end
