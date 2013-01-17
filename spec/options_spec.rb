require "spec_helper"
require "espago/options"

describe Espago::Options do
  it "should raise an exception when initializing" do
    expect { Espago::Options.new }.to raise_error(NoMethodError)
  end

  it "should be a singleton" do
    first_config = Espago::Options.instance
    second_config = Espago::Options.instance

    first_config.object_id.should == second_config.object_id
  end

  it "should modify options" do
    Espago::Options.config do |config|

      expect {config.public_key = '123'}.to change{config.public_key}.to('123')
      expect {config.app_id = '1234'}.to change{config.app_id}.to('1234')
    end
  end

end