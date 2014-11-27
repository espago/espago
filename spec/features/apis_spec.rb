require "spec_helper"

describe 'Two api headers test' do

  it "API v.2" do
    Espago.api_version = '2'
    VCR.use_cassette('api 2') do
      response = Espago.charges :get
      response.count.should eq(596)
    end
  end

  it "API v.3" do
    Espago.api_version = '3'
    VCR.use_cassette('api 3') do
      response = Espago.charges :get
      response.count.should eq(596)
    end
  end

end
