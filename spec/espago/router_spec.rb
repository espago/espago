require "spec_helper"
require "espago/router"
require "pry"

class Espago::ApiConnection::GetStubbed; end

describe Espago::Router do
  subject { Espago::Router.new(:stubbed, :get) }

  it { subject.should respond_to :path}
  it { subject.should respond_to :method}

  context "#route" do
    it "should get a class name depending on path and method" do
      subject.route.should eq( Espago::ApiConnection::GetStubbed )
    end

    it "should raise error if class not found" do
      subject { Espago::Router.new(:not, :existing) }
      expect { subject.route.to raise_error( Espago::Router::NoPathError ) }
    end
  end
end
