require "spec_helper"

describe 'Fake errors!' do

  it "should get 500 error" do
    VCR.use_cassette('error 500') do
      expect {response = Espago.plans :get }.to raise_error(Espago::ApiError)
    end
  end

  it "should get 400 error" do
    VCR.use_cassette('error 400') do
      expect {response = Espago.plans :get }.to raise_error(Espago::InvalidRequestError)
    end
  end

  it "should get 401 error" do
    VCR.use_cassette('error 401') do
      expect {response = Espago.plans :get }.to raise_error(Espago::AuthenticationError)
    end
  end

  it "method missing" do
    VCR.use_cassette('method missing') do
      expect {Espago.method_missing :get}.to raise_error(NoMethodError)
    end
  end
end
