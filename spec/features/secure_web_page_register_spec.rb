require 'spec_helper'

describe 'Espago.secure_web_page_register' do
  it 'should get params from new charge' do
    VCR.use_cassette('secure_web_page_register post') do
      Espago.app_id = 'app12345'
      Espago.app_password = 'Api12345'
      Espago.api_version = '3'
      response = Espago.secure_web_page_register :post,
                                                 amount: '49.99',
                                                 currency: 'PLN',
                                                 description: 'Test12345',
                                                 client_description: 'Jan Kowalski',
                                                 kind: 'sale'
      expect(response.status).to eq(201)
      expect(response.state).to eq('new')
      expect(response.currency).to eq('PLN')
      expect(response.description).to eq('Test12345')
      expect(response.id).to eq('pay_770swCpLvm5dzrqk')
      expect(response.created_at).to eq Time.at(1_555_344_189)
    end
  end
end
