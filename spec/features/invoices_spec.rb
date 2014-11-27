require "spec_helper"

describe 'Espago.invoices' do

  it "should get list of invoices" do
    VCR.use_cassette('invoices get') do
      response = Espago.invoices :get
      response.count.should eq(1)
      response.invoices.size.should eq(1)
    end
  end

  it "should get info abount invoices" do
    VCR.use_cassette('invoices get in_tUCMhwlg2nkvAaL') do
      response = Espago.invoices :get,{invoice_id:'in_tUCMhwlg2nkvAaL'}
      response.paid.should eq(true)
      response.client.should eq('cli_90Pi6Jf0ndl_PP')
      response.amount.should eq('123.45')
      response.created_at.should eq Time.at(1417030497)
    end
  end


end
