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

  context "#config" do
    it "should set values" do
      Espago::Options.config {|c| c.public_key = '123'}
      Espago::Options.public_key.should == '123'
    end
  end
end