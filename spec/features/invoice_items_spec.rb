require "spec_helper"

describe 'Espago.invoice_items' do

  it "should get info abount invoice_items" do
    VCR.use_cassette('invoice_items get ii_5LS-YR7S1QaJBl3') do
      response = Espago.invoice_items :get,{invoice_item_id:'ii_5LS-YR7S1QaJBl3'}
      expect(response.client).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.amount).to eq('123.45')
      expect(response.created_at).to eq Time.at(1417030496)
    end
  end

  it "should get info abount invoice_items" do
    VCR.use_cassette('invoice_items post ii_5LS-YR7S1QaJBl3') do
      response = Espago.invoice_items :post,{ amount:49.99,
                                              currency:'pln',
                                              date:'1417126942',
                                              description: 'Test invoice items',
                                              client: 'cli_90Pi6Jf0ndl_PP'
                                            }
      expect(response.status).to eq(201)
      expect(response.client).to eq('cli_90Pi6Jf0ndl_PP')
      expect(response.amount).to eq('49.99')
      expect(response.currency).to eq('pln')
      expect(response.created_at).to eq Time.at(1417102491)
    end
  end

    it "should get info abount deleted invoice_items" do
    VCR.use_cassette('invoice_items delete ii_WDzszvhTshe78Xd') do
      response = Espago.invoice_items :delete,{invoice_item_id:'ii_WDzszvhTshe78Xd'}
      expect(response.status).to eq(204)
    end
  end

end
