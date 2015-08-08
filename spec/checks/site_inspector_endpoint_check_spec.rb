require 'spec_helper'

describe SiteInspector::Endpoint::Check do

  subject do
    stub_request(:get, "http://example.com/").to_return(:status => 200)
    endpoint = SiteInspector::Endpoint.new("http://example.com")
    SiteInspector::Endpoint::Check.new(endpoint)
  end

  it "returns the endpoint" do
    expect(subject.endpoint.class).to eql(SiteInspector::Endpoint)
  end

  it "returns the response" do
    expect(subject.response.class).to eql(Typhoeus::Response)
  end

  it "returns the request" do
    expect(subject.request.class).to eql(Typhoeus::Request)
  end

  it "returns the host" do
    expect(subject.host).to eql("example.com")
  end

  it "returns its name" do
    expect(subject.name).to eql(:check)
  end

  it "returns the instance name" do
    expect(SiteInspector::Endpoint::Check.name).to eql(:check)
  end

  it "enables the check" do
    expect(subject.enabled?).to eql(true)
  end
end
