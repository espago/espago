require "spec_helper"
require "espago/back_request"
require "json"


describe Espago::BackRequest do
  subject { Espago::BackRequest.new(response)}
  let(:response) {
    {"id"=>"in_tUCMhwlg2nkvAaL",
     "date"=>"1417030496",
     "client"=>"cli_90Pi6Jf0ndl_PP",
     "subscription"=>"sub_8yYuCBKdywr7e2",
     "amount"=>"123.45",
     "currency"=>"pln",
     "paid"=>"true",
     "issuer_response_code"=>"00",
     "attempts"=>"1",
     "next_payment_attempt"=>"",
     "created_at"=>1417030497
     }
  }
  it {
    expect(subject.id).to eq("in_tUCMhwlg2nkvAaL")
    expect(subject.subscription).to eq("sub_8yYuCBKdywr7e2")
    expect(subject.amount).to eq("123.45")
    expect(subject.currency).to eq("pln")
    expect(subject.paid).to eq("true")
    expect(subject.client).to eq("cli_90Pi6Jf0ndl_PP")
    expect(subject.created_at).to eq(Time.at(1417030497))
    expect(subject.card).to eq({})
    expect(subject.imaginated_attribute).to be_nil
  }
end
