# encoding: utf-8

require 'spec_helper'

RSpec.describe Github::Client::Repos::Keys, '#create' do
  let(:user) { 'peter-murach' }
  let(:repo) { 'github' }
  let(:request_path) { "/repos/#{user}/#{repo}/keys" }
  let(:inputs) { {:title => "octocat@octomac", :key => "ssh-rsa AAA..." } }

  before {
    stub_post(request_path).with(body: inputs).
      to_return(body: body, status: status,
        headers: {content_type: "application/json; charset=utf-8"})
  }

  after { reset_authentication_for(subject) }

  context "resource created" do
    let(:body) { fixture("repos/key.json") }
    let(:status) { 201 }

    it "should create the resource" do
      subject.create(user, repo, inputs)
      expect(a_post(request_path).with(body: inputs)).to have_been_made
    end

    it "should get the key information back" do
      key = subject.create(user, repo, inputs)
      expect(key.title).to eq('octocat@octomac')
    end
  end

  it_should_behave_like 'request failure' do
    let(:requestable) { subject.create user, repo, inputs }
  end
end # create
