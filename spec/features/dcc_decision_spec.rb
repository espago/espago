
require "spec_helper"

describe 'Espago.dcc_decision' do

  it "should get params from new charge" do
    VCR.use_cassette('dcc_decision post') do
      response = Espago.dcc_decision :post, {charge_id:'pay_mTOngouLTJWZ0w', decision:'Y'}
      expect(response.status).to eq(201)
      expect(response.channel).to eq('elavon')
      expect(response.state).to eq('executed')
      expect(response.currency).to eq('PLN')
      expect(response.description).to eq('Test12345')
      expect(response.client).to eq('cli_YM5tKz6-IfhN7T')
      expect(response.created_at).to eq Time.at(1416917311)
    end
  end


end
