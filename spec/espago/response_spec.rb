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
  it {
    expect(subject.id).to eq("pay_hViT20SOWaUL_w")
    expect(subject.description).to eq("Zakupy z example.com")
    expect(subject.amount).to eq("49.99")
    expect(subject.currency).to eq("pln")
    expect(subject.state).to eq("executed")
    expect(subject.client).to eq("cli_wm7dGQltAqIfH8")
    expect(subject.created_at).to eq(Time.parse("2013-06-28 10:31:14 +0200"))
    expect(subject.imaginated_attribute).to be_nil
  }
end
