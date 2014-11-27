require "spec_helper"

describe 'Espago.plans' do

  it "should get list of plans" do
    VCR.use_cassette('plans get') do
      response = Espago.plans :get
      response.count.should eq(1)
      response.plans.size.should eq(1)
    end
  end

  it "should get info abount plans" do
    VCR.use_cassette('plans get pl_12345') do
      response = Espago.plans :get,{plan_id:'pl_12345'}
      response.description.should eq('Golden plan')
      response.period.should eq(5)
      response.period_unit.should eq('days')
      response.amount.should eq(123.45)
      response.created_at.should eq Time.at(1413807490)
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
      response.status.should eq(201)
      response.description.should eq('Test Plan')
      response.period.should eq(14)
      response.period_unit.should eq('day')
      response.amount.should eq('49.99')
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
      response.status.should eq(204)
    end
  end

  it "should get 204 after deleted plan" do
    VCR.use_cassette('plans delete') do
      response = Espago.plans :delete, { plan_id: 'pl_XczKHr_42CRiKXZ'}
      response.status.should eq(204)
    end
  end

end
