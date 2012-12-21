require 'spec_helper'

describe NetDna2::Client do
  before(:all) do
    @client = NetDna2::Client.new NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, NETDNA_COMPANY_ALIAS
  end
  
  describe "#initialize" do
    subject { @client }
    
    context "when called with three correct parameters {key, secret, alias}" do
      it { should_not be_nil }
    end
    
    context "when called with an incorrect key/secret" do
      it "should raise a ArgumentError" do
        expect{NetDna2::Client.new(NETDNA_CONSUMER_KEY, '000', NETDNA_COMPANY_ALIAS)}.to raise_error(SecurityError)
      end
    end
    
    context "when called with an incorrect company_alias" do
      it "should raise a SecurityError" do
        expect{NetDna2::Client.new(NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, 'pig')}.to raise_error(SecurityError)
      end
    end
    
    context "when called with missing parameters" do
      it "should raise a ArgumentError" do
        expect{NetDna2::Client.new}.to raise_error(ArgumentError)
      end
    end
  end
  
  describe "#access" do
    subject { @client.access }
    
    context "when there is a successful authentication" do
      it { should_not be_nil }
    end
  end
  
  describe "#access_status" do
    subject { @client.access_status }
    
    context "when there is a successful authentication" do
      it { should eq("200") }
    end
  end
  
  describe "#company_alias" do
    subject { @client.company_alias }
    
    context "when a String[company_alias] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_COMPANY_ALIAS) }
    end
  end
  
  describe "#consumer_key" do
    subject { @client.consumer_key }
    
    context "when a String[consumer_key] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_CONSUMER_KEY) }
    end
  end
  
  describe "#consumer_secret" do
    subject { @client.consumer_secret }
    
    context "when a String[consumer_secret] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_CONSUMER_SECRET) }
    end
  end
end