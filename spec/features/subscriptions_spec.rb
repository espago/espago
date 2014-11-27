require "spec_helper"

describe 'Espago.subscriptions' do

  it "should get list of subscriptions" do
    VCR.use_cassette('subscriptions get') do
      response = Espago.subscriptions :get
      response.count.should eq(1)
      response.subscriptions.size.should eq(1)
    end
  end

  it "should get info abount subscriptions" do
    VCR.use_cassette('subscriptions get sub_8yYuCBKdywr7e2') do
      response = Espago.subscriptions :get,{subscription_id:'sub_8yYuCBKdywr7e2'}
      response.status.should eq(200)
      response.state.should eq('active')
      response.client.should eq('cli_90Pi6Jf0ndl_PP')
      response.plan.should eq('pl_12345')
      response.last_invoice.should be_kind_of(Hash)
    end
  end

  it "should get params from new plan" do
    VCR.use_cassette('subscriptions post') do
      response = Espago.subscriptions :post,{ plan:'pl_12345',client:'cli_90Pi6Jf0ndl_PP'}
      response.status.should eq(201)
      response.state.should eq('active')
      response.client.should eq('cli_90Pi6Jf0ndl_PP')
      response.plan.should eq('pl_12345')
      response.last_invoice.should be_kind_of(Hash)
    end
  end

  it "should get info after deleted subscription" do
    VCR.use_cassette('subscriptions delete sub_8yYuCBKdywr7e2') do
      response = Espago.subscriptions :delete,{subscription_id:'sub_8yYuCBKdywr7e2'}
      response.status.should eq(204)
    end
  end


end
