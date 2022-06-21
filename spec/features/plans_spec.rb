require "spec_helper"

describe 'Espago.plans' do

  it "should get list of plans" do
    VCR.use_cassette('plans get') do
      response = Espago.plans :get
      expect(response.count).to eq(1)
      expect(response.plans.size).to eq(1)
    end
  end

  it "should get info abount plans" do
    VCR.use_cassette('plans get pl_12345') do
      response = Espago.plans :get,{plan_id:'pl_12345'}
      expect(response.description).to eq('Golden plan')
      expect(response.period).to eq(5)
      expect(response.period_unit).to eq('days')
      expect(response.amount).to eq(123.45)
      expect(response.created_at).to eq Time.at(1413807490)
    end
  end

  it "should get params from new plan" do
    VCR.use_cassette('plans post') do
      response = Espago.plans :post, { period_unit: 'day',
                                       period: 14,
                                       amount: 49.99,
                                       currency: 'pln',
                                       description: 'Test Plan'
                                       }
      expect(response.status).to eq(201)
      expect(response.description).to eq('Test Plan')
      expect(response.period).to eq(14)
      expect(response.period_unit).to eq('day')
      expect(response.amount).to eq('49.99')
    end
  end


  it "should get params from updated plan" do
    VCR.use_cassette('plans put') do
      response = Espago.plans :put, { plan_id: 'pl_XczKHr_42CRiKXZ',
                                      period_unit: 'month',
                                      period: 1,
                                      amount: 149.99,
                                      currency: 'pln',
                                      description: 'Test Plan'
                                      }
      expect(response.status).to eq(204)
    end
  end

  it "should get 204 after deleted plan" do
    VCR.use_cassette('plans delete') do
      response = Espago.plans :delete, { plan_id: 'pl_XczKHr_42CRiKXZ'}
      expect(response.status).to eq(204)
    end
  end

end
