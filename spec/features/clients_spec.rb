require "spec_helper"

describe 'Espago.clients' do

  it "should get list of clients" do
    VCR.use_cassette('clients get') do
      response = Espago.clients :get
      response.count.should eq(597)
    end
  end

  it "should get info abount clients" do
    VCR.use_cassette('clients get cli_w0Se2smYwyQ0Uw') do
      response = Espago.clients :get,{client_id:'cli_w0Se2smYwyQ0Uw'}
      response.email.should eq(nil)
      response.card['company'].should eq('VI')
      response.description.should eq(nil)
      response.created_at.should eq Time.at(1417004837)
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
      response.status.should eq(201)
      response.card['company'].should eq('VI')
      response.card['last4'].should eq('4242')
      response.card['authorized'].should eq(nil)
      response.deleted.should eq(false)
      response.created_at.should eq Time.at(1417007099)
    end
  end

  it "should get status after authorize client card" do
    VCR.use_cassette('clients authorize') do
      response = Espago.clients_authorize :post,{client_id:'cli_w0Se2smYwyQ0Uw'}
      response.status.should eq(201)
      response.card['company'].should eq('VI')
      response.card['last4'].should eq('1112')
      response.card['authorized'].should eq(true)
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
      response.status.should eq(200)
      response.card['company'].should eq('VI')
      response.card['last4'].should eq('4242')
      response.card['authorized'].should eq(nil)
      response.deleted.should eq(false)
      response.created_at.should eq Time.at(1417004837)
    end
  end

  it "should get client invoices" do
    VCR.use_cassette('clients invoices') do
      response = Espago.clients_invoices :get, { client_id:'cli_w0Se2smYwyQ0Uw'}
      response.status.should eq(200)
      response.count.should eq(0)
      response.invoices.should eq([])
    end
  end


  it "should get client subscriptions" do
    VCR.use_cassette('clients subscriptions') do
      response = Espago.clients_subscriptions :get, { client_id:'cli_w0Se2smYwyQ0Uw'}
      response.status.should eq(200)
      response.count.should eq(0)
      response.subscriptions.should eq([])
    end
  end

  it "should get status 204 after delete client" do
    VCR.use_cassette('clients delete') do
      response = Espago.clients :delete, { client_id:'cli_5rDoJyvKDM4RbM'}
      response.status.should eq(204)
    end
  end

end
