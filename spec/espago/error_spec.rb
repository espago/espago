require "spec_helper"
require "espago/error"
require "json"
require "helpers/fake_response"

describe Espago::Error do
  subject { Espago::Error.new(response) }
  response_body = 'body'

  let(:response) {
    FakeResponse.new(422, response_body)
  }
  it "should be success" do
    expect(subject.body).to eq('body')
    expect(subject.status).to eq(422)
  end
end
