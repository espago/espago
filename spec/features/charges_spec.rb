

require "spec_helper"

describe 'Espago.charges' do

  it "should get list of charges" do
    VCR.use_cassette('charges get') do
      response = Espago.charges :get
      expect(response.count).to eq(589)
    end
  end

  it "should get info abount charges" do
    VCR.use_cassette('charges get pay_mTOngouLTJWZ0w') do
      response = Espago.charges :get,{charge_id:'pay_mTOngouLTJWZ0w'}
      expect(response.status).to eq(200)
      expect(response.channel).to eq('elavon')
      expect(response.state).to eq('executed')
      expect(response.currency).to eq('PLN')
      expect(response.description).to eq('Test12345')
      expect(response.client).to eq('cli_YM5tKz6-IfhN7T')
      expect(response.created_at).to eq Time.at(1416917311)
    end
  end

  it "should get params from new charge" do
    VCR.use_cassette('charges post') do
      response = Espago.charges :post, { amount:'49.99',
                                         currency:'PLN',
                                         description:'Test12345',
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
      expect(response.channel).to eq('elavon')
      expect(response.state).to eq('executed')
      expect(response.currency).to eq('PLN')
      expect(response.description).to eq('Test12345')
      expect(response.client).to eq('cli_YM5tKz6-IfhN7T')
      expect(response.created_at).to eq Time.at(1416917311)
    end
  end

  it "should get params from new charge init" do
    VCR.use_cassette('charges init post') do
      response = Espago.charges_init :post, {
                                         amount:'49.99',
                                         currency:'PLN',
                                         description:'Test12345',
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
      expect(response.channel).to eq('elavon')
      expect(response.state).to eq('new')
      expect(response.id).to eq('pay_96aTW2otjImiHhCd')
      expect(response.currency).to eq('PLN')
      expect(response.description).to eq('Test12345')
      expect(response.client).to eq('cli_96acHmkHkj36w3Xk')
      expect(response.created_at).to eq Time.at(1728462384)
      expect(response.payment_token).to eq('86ba284f-3ad6-4b50-94c0-be3377a6f6c5')
    end
  end

  it "should get 204 status after destroy charge" do
    VCR.use_cassette('charges destroy') do
      response = Espago.charges :delete,{charge_id:'pay_kQmS_3RTfm4eix'}
      expect(response.state).to eq('reversed')
    end
  end

  it "should get refunded status after refund charge" do
    VCR.use_cassette('charges refund') do
      response = Espago.charges_refund :post,{charge_id:'pay_lQGyIon5qG59O5'}
      expect(response.state).to eq('refunded')
    end
  end

  it "should get params from complete charge" do
    VCR.use_cassette('charges complete') do
      response = Espago.charges_complete :post,{charge_id:'pay_kQmS_3RTfm4eix'}
      expect(response.state).to eq('executed')
    end
  end

  it "should get params from complete charge (deprecated)" do
    VCR.use_cassette('charges complete deprecation') do
      response = Espago.complete :post,{charge_id:'pay_Wmu3hmXJIG4jsg'}
      expect(response.state).to eq('executed')
    end
  end

end
