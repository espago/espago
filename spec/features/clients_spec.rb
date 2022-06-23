require "spec_helper"

describe 'Espago.clients' do

  it "should get list of clients" do
    VCR.use_cassette('clients get') do
      response = Espago.clients :get
      expect(response.count).to eq(597)
    end
  end

  it "should get info abount clients" do
    VCR.use_cassette('clients get cli_w0Se2smYwyQ0Uw') do
      response = Espago.clients :get,{client_id:'cli_w0Se2smYwyQ0Uw'}
      expect(response.email).to eq(nil)
      expect(response.card['company']).to eq('VI')
      expect(response.description).to eq(nil)
      expect(response.created_at).to eq Time.at(1417004837)
    end
  end

  it "should get params from new client" do
    VCR.use_cassette('clients post') do
      response = Espago.clients :post, { card: {
                                           first_name: 'Jan',
                                           last_name: 'Kowalski',
                                           number: '424242424242',
                                           verification_value: '123',
                                           year:'2015',
                                           month:'2'
                                         },
                                         }
      expect(response.status).to eq(201)
      expect(response.card['company']).to eq('VI')
      expect(response.card['last4']).to eq('4242')
      expect(response.card['authorized']).to eq(nil)
      expect(response.deleted).to eq(false)
      expect(response.created_at).to eq Time.at(1417007099)
    end
  end

  it "should get status after authorize client card" do
    VCR.use_cassette('clients authorize') do
      response = Espago.clients_authorize :post,{client_id:'cli_w0Se2smYwyQ0Uw'}
      expect(response.status).to eq(201)
      expect(response.card['company']).to eq('VI')
      expect(response.card['last4']).to eq('1112')
      expect(response.card['authorized']).to eq(true)
    end
  end


  it "should get params from updated client" do
    VCR.use_cassette('clients put') do
      response = Espago.clients :put, { client_id:'cli_w0Se2smYwyQ0Uw',
                                        card: {
                                          first_name: 'Jan',
                                          last_name: 'Kowalski',
                                          number: '4242424242424242',
                                          verification_value: '123',
                                          year:'2015',
                                          month:'2'
                                        },
                                      }
      expect(response.status).to eq(200)
      expect(response.card['company']).to eq('VI')
      expect(response.card['last4']).to eq('4242')
      expect(response.card['authorized']).to eq(nil)
      expect(response.deleted).to eq(false)
      expect(response.created_at).to eq Time.at(1417004837)
    end
  end

  it "should get client invoices" do
    VCR.use_cassette('clients invoices') do
      response = Espago.clients_invoices :get, { client_id:'cli_w0Se2smYwyQ0Uw'}
      expect(response.status).to eq(200)
      expect(response.count).to eq(0)
      expect(response.invoices).to eq([])
    end
  end


  it "should get client subscriptions" do
    VCR.use_cassette('clients subscriptions') do
      response = Espago.clients_subscriptions :get, { client_id:'cli_w0Se2smYwyQ0Uw'}
      expect(response.status).to eq(200)
      expect(response.count).to eq(0)
      expect(response.subscriptions).to eq([])
    end
  end

  it "should get status 204 after delete client" do
    VCR.use_cassette('clients delete') do
      response = Espago.clients :delete, { client_id:'cli_5rDoJyvKDM4RbM'}
      expect(response.status).to eq(204)
    end
  end

end
