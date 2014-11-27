require "spec_helper"

describe 'Espago.line_items' do

  it "should get info abount line_items" do
    VCR.use_cassette('line_items get') do
      response = Espago.line_items :get,{invoice_id:'in_tUCMhwlg2nkvAaL'}
      response.count.should eq(1)
      response.invoice_items[0]['client'].should eq('cli_90Pi6Jf0ndl_PP')
      response.invoice_items[0]['amount'].should eq('123.45')
      response.invoice_items[0]['description'].should eq('Golden plan')
      response.invoice_items[0]['created_at'].should eq(1417030496)
    end
  end


end
