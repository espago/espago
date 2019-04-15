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
      response.status.should eq(201)
      response.state.should eq('new')
      response.currency.should eq('PLN')
      response.description.should eq('Test12345')
      response.id.should eq('pay_770swCpLvm5dzrqk')
      response.created_at.should eq Time.at(1_555_344_189)
    end
  end
end
