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

  its(:id) { should eq("in_tUCMhwlg2nkvAaL") }
  its(:subscription) { should eq("sub_8yYuCBKdywr7e2") }
  its(:amount) { should eq("123.45") }
  its(:currency) { should eq("pln") }
  its(:paid) { should eq("true") }
  its(:client) { should eq("cli_90Pi6Jf0ndl_PP") }
  its(:created_at) { should eq(Time.at(1417030497)) }
  its(:card) { should eq({}) }
  its(:imaginated_attribute) { should be_nil }

end
