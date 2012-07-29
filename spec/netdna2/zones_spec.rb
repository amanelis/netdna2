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
      @zones.company_alias.should == NETDNA_COMPANY_ALIAS && @zones.company_alias.should_not == nil
    end
    
    it '@zones.consumer_key' do
      @zones.consumer_key.should == NETDNA_CONSUMER_KEY && @zones.consumer_key.should_not == nil
    end
    
    it '@zones.consumer_secret' do
      @zones.consumer_secret.should == NETDNA_CONSUMER_SECRET && @zones.consumer_secret.should_not == nil
    end
    
    ## list_zones
    ##########################################
    it '@zones.list_zones w/out parameters' do
      @zones.list_zones.should_not == nil 
    end
    
    it '@zones.list_zones WITH parameters(page: 2) response should return' do
      response = @zones.list_zones(page: 2)
      response.should_not == nil && response.class.should == Hash
    end
    
    it '@zones.list_zones WITH parameters(page: 2) should return :page => 2' do
      response = @zones.list_zones(page: 2)
      response_page = response['data']['page'].to_i
      response_page.should == 2 && response['data'].class.should == Hash
    end
    
    it '@zones.list_zones WITH parameters(page: 2) should return :zones => []' do
      response = @zones.list_zones(page: 2)
      response_zones = response['data']
      response_zones.should_not == nil && response_zones.class.should == Array
    end
  
    
    ## zone_summary 
    ##########################################
    
    
  end
end



















