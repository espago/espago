require 'spec_helper'
require 'espago/client'

describe Espago::Client do
  subject { Espago::Client.new(pub_key: 'public_key', app_id: 'App12345') }

  context "#initialize" do
    context "with valid params" do
      its(:public_key) { should_not be_empty }
      its(:app_id) { should_not be_empty }
    end

    context "with invalid params" do
      it "should raise an error if public_key empty" do
        expect { Espago::Client.new }.to raise_error
      end
    end
  end
end
