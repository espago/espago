require "spec_helper"
require "espago/router"

class Espago::ApiConnection::StubbedRequestGet; end

describe Espago::Router do
  subject { Espago::Router.new(:stubbed_request, :get) }

  it { expect(subject).to respond_to :path}
  it { expect(subject).to respond_to :method}

  context "#route" do
    it "should get a class name depending on path and method" do
      expect(subject.route).to eq( Espago::ApiConnection::StubbedRequestGet )
    end

    it "should raise error if class not found" do
      subject { Espago::Router.new(:not, :existing) }
      expect { subject.route.to raise_error( Espago::Router::NoPathError ) }
    end
  end

  context "#path_exists?" do
    it "should return if path exists" do
      expect(subject.path_exists?).to be_truthy
    end

    context "with invalid path name" do
      subject { Espago::Router.new(:not, :existing) }

      it "should return false" do
        expect(subject.path_exists?).not_to be_truthy
      end
    end
  end
end
