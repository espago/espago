require "spec_helper"
require "espago/router"

class Espago::ApiConnection::GetStubbed; end

describe Espago::Router do
  subject { Espago::Router }

  context "#path_to" do
    it "should get a class name depending on path and method" do
      subject.path_to(:stubbed, :get).should eq( Espago::ApiConnection::GetStubbed )
    end

    it "should raise error if class not found" do
      expect { subject.path_for(:not, :existing).to raise_error( Espago::Router::NoPathError ) }
    end
  end
end
