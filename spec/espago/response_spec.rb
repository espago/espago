require 'spec_helper'
require 'espago/response'
require 'helpers/fake_response'

describe Espago::Response do
  subject { Espago::Response.new(response)}
  let(:response) {
    FakeResponse.new(200, {
      id: "pay_hViT20SOWaUL_w",
      description: "Zakupy z example.com",
      amount: "49.99",
      currency: "pln",
      state: "executed",
      client: "cli_wm7dGQltAqIfH8",
      created_at: 1372408274,
      card:{
        company: "VI",
        last4: "4242",
        year: 2019,
        month: 4,
        first_name: "Piotr",
        last_name: "Nowak",
        authorized: true,
        created_at: 1372408274
      }
    }.to_json)
  }

  its(:id) { should eq("pay_hViT20SOWaUL_w") }
  its(:description) { should eq("Zakupy z example.com") }
  its(:amount) { should eq("49.99") }
  its(:currency) { should eq("pln") }
  its(:state) { should eq("executed") }
  its(:client) { should eq("cli_wm7dGQltAqIfH8") }
  its(:created_at) { should eq(Time.parse("2013-06-28 10:31:14 +0200")) }
  its(:imaginated_attribute) { should be_nil }

end
