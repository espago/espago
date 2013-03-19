require 'spec_helper'
require 'espago/response'
 
describe Espago::Response do
  subject { Espago::Response.new(response)}
  let(:response) {
    {
      id: "pay_hViT20SOWaUL_w",
      description: "Zakupy z example.com",
      amount: "49.99",
      currency: "pln",
      state: "executed",
      client: "cli_wm7dGQltAqIfH8",
      created_at: "20130222161633",
      card:{
        company: "VI",
        last4: "4242",
        year: 2019,
        month: 4,
        first_name: "Piotr",
        last_name: "Nowak",
        authorized: true,
        created_at: "20130222153946"
      }
    }.to_json
  }
 
  its(:response_id) { should eq("pay_hViT20SOWaUL_w") }
  its(:description) { should eq("Zakupy z example.com") }
  its(:amount) { should eq("49.99") }
  its(:currency) { should eq("pln") }
  its(:state) { should eq("executed") }
  its(:client) { should eq("cli_wm7dGQltAqIfH8") }
  its(:created_at) { should eq(Time.parse("20130222161633")) }
 
end