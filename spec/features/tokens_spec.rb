require "spec_helper"

describe 'Espago.tokens' do

  it "should get params from new token" do
    VCR.use_cassette('tokens post') do
      response = Espago.tokens :post, {
        card: {
          first_name: 'Jan',
          last_name: 'Kowalski',
          number: '4242424242424242',
          verification_value: '123',
          year:'2015',
          month:'2'
        },
      }
      response.status.should eq(201)
      response.id.should_not eq(nil)
      response.used.should eq(false)
      response.created_at.should eq Time.at(1417029320)
      response.card['company'].should eq('VI')
      response.card['last4'].should eq('4242')
      response.card['authorized'].should eq(nil)
    end
  end

    it "should get token params" do
    VCR.use_cassette('tokens get') do
      response = Espago.tokens :get, {token_id: 'cc_166YDMhrVcemFb3'}
      response.status.should eq(200)
      response.id.should eq('cc_166YDMhrVcemFb3')
      response.used.should eq(false)
      response.created_at.should eq Time.at(1417029320)
      response.card['company'].should eq('VI')
      response.card['last4'].should eq('4242')
      response.card['authorized'].should eq(nil)
    end
  end

end
