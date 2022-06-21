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
      expect(response.status).to eq(201)
      expect(response.id).to_not eq(nil)
      expect(response.used).to eq(false)
      expect(response.created_at).to eq Time.at(1417029320)
      expect(response.card['company']).to eq('VI')
      expect(response.card['last4']).to eq('4242')
      expect(response.card['authorized']).to eq(nil)
    end
  end

    it "should get token params" do
    VCR.use_cassette('tokens get') do
      response = Espago.tokens :get, {token_id: 'cc_166YDMhrVcemFb3'}
      expect(response.status).to eq(200)
      expect(response.id).to eq('cc_166YDMhrVcemFb3')
      expect(response.used).to eq(false)
      expect(response.created_at).to eq Time.at(1417029320)
      expect(response.card['company']).to eq('VI')
      expect(response.card['last4']).to eq('4242')
      expect(response.card['authorized']).to eq(nil)
    end
  end

end
