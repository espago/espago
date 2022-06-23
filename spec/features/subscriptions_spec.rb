require "spec_helper"

describe 'Espago.subscriptions' do

  it "should get list of subscriptions" do
    VCR.use_cassette('subscriptions get') do
      response = Espago.subscriptions :get
      expect(response.count).to eq(1)
      expect(response.subscriptions.size).to eq(1)
    end
  end

  it "should get info abount subscriptions" do
    VCR.use_cassette('subscriptions get sub_8yYuCBKdywr7e2') do
      response = Espago.subscriptions :get,{subscription_id:'sub_8yYuCBKdywr7e2'}
      expect(response.status).to eq(200)
      expect(response.state).to eq('active')
      expect(response.client).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.plan).to eq('pl_12345')
      expect(response.last_invoice).to be_kind_of(Hash)
    end
  end

  it "should get params from new plan" do
    VCR.use_cassette('subscriptions post') do
      response = Espago.subscriptions :post,{ plan:'pl_12345',client:'cli_90Pi6Jf0ndl_PP'}
      expect(response.status).to eq(201)
      expect(response.state).to eq('active')
      expect(response.client).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.plan).to eq('pl_12345')
      expect(response.last_invoice).to be_kind_of(Hash)
    end
  end

  it "should get info after deleted subscription" do
    VCR.use_cassette('subscriptions delete sub_8yYuCBKdywr7e2') do
      response = Espago.subscriptions :delete,{subscription_id:'sub_8yYuCBKdywr7e2'}
      expect(response.status).to eq(204)
    end
  end


end
