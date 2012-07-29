require 'spec_helper'


describe NetDna2::Zones do
  context "Zones" do
    before(:all) do
      @zones = NetDna2::Zones.new 
    end
    
    it '.initialize' do
      @zones.should_not == nil
    end
    
    it '@zones.access' do
      @zones.access.should_not == nil
    end
    
    it '@zones.access_status' do
      @zones.access_status.should == nil
    end
    
    it '@zones.company_alias' do
      @zones.company_alias.should_not == nil && @zones.company_alias.should == NETDNA_COMPANY_ALIAS
    end
    
    it '@zones.consumer_key' do
      @zones.consumer_key.should_not == nil && @zones.consumer_key.should == NETDNA_CONSUMER_KEY
    end
    
    it '@zones.consumer_secret' do
      @zones.consumer_secret.should_not == nil && @zones.consumer_secret.should == NETDNA_CONSUMER_SECRET
    end
    
    # Zone API endpoint methods
    it '@zones.list_zones w/out parameters' do
      @zones.list_zones.should_not == nil 
    end
    
    it '@zones.list_zones WITH parameters' do
      @zones.list_zones(page: 2).should_not == nil 
    end
    
  end
end