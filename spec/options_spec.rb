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
end
