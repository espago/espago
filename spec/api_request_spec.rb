require "spec_helper"
require "espago/api_request"

class StubbedResponse < Struct.new(:body); end

class Espago::ApiRequest::StubbedPath
  def initialize(connection); end

  def request(params = {})
    StubbedResponse.new('returned api data')
  end
end

describe Espago::ApiRequest do

  context "#create" do
    it "should return reponse body" do
      subject.create(:path, :stubbed).should eq('returned api data')
    end

    it "should raise an error if path not found" do
      expect { subject.create(:fake, :class) }.to raise_error(Espago::ApiRequest::NoPathError)
    end
  end
end
