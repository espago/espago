require "spec_helper"

describe 'Espago.invoices' do

  it "should get list of invoices" do
    VCR.use_cassette('invoices get') do
      response = Espago.invoices :get
      expect(response.count).to eq(1)
      expect(response.invoices.size).to eq(1)
    end
  end

  it "should get info abount invoices" do
    VCR.use_cassette('invoices get in_tUCMhwlg2nkvAaL') do
      response = Espago.invoices :get,{invoice_id:'in_tUCMhwlg2nkvAaL'}
      expect(response.paid).to eq(true)
      expect(response.client).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.amount).to eq('123.45')
      expect(response.created_at).to eq Time.at(1417030497)
    end
  end


end
