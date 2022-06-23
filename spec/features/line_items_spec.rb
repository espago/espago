require "spec_helper"

describe 'Espago.line_items' do

  it "should get info abount line_items" do
    VCR.use_cassette('line_items get') do
      response = Espago.line_items :get,{invoice_id:'in_tUCMhwlg2nkvAaL'}
      expect(response.count).to eq(1)
      expect(response.invoice_items[0]['client']).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.invoice_items[0]['amount']).to eq('123.45')
      expect(response.invoice_items[0]['description']).to eq('Golden plan')
      expect(response.invoice_items[0]['created_at']).to eq(1417030496)
    end
  end


end
