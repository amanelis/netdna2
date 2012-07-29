require 'spec_helper'


describe NetDna2::Zones do
  context "Zones" do
    before(:all) do
      @client = NetDna2::Zones.new NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, NETDNA_COMPANY_ALIAS
    end
    
    it '.initialize' do
      @client.should_not == nil
    end
    
    it '@client.access' do
      @client.access.should_not == nil
    end
    
    it '@client.access_status' do
      @client.access_status.should == nil
    end
    
    it '@client.company_alias' do
      @client.company_alias.should_not == nil && @client.company_alias.should == NETDNA_COMPANY_ALIAS
    end
    
    it '@client.consumer_key' do
      @client.consumer_key.should_not == nil && @client.consumer_key.should == NETDNA_CONSUMER_KEY
    end
    
    it '@client.consumer_secret' do
      @client.consumer_secret.should_not == nil && @client.consumer_secret.should == NETDNA_CONSUMER_SECRET
    end
  end
end