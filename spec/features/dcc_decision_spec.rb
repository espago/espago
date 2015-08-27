
require "spec_helper"

describe 'Espago.dcc_decision' do

  it "should get params from new charge" do
    VCR.use_cassette('dcc_decision post') do
      response = Espago.dcc_decision :post, {charge_id:'pay_mTOngouLTJWZ0w', decision:'Y'}
      response.status.should eq(201)
      response.channel.should eq('elavon')
      response.state.should eq('executed')
      response.currency.should eq('PLN')
      response.description.should eq('Test12345')
      response.client.should eq('cli_YM5tKz6-IfhN7T')
      response.created_at.should eq Time.at(1416917311)
    end
  end


end
