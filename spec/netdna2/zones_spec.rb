require 'spec_helper'


describe NetDna2::Zones do
  before(:all) do
    @zones = NetDna2::Zones.new 
  end
  
  # it '.initialize' do
  #   @zones.should_not == nil
  # end
  # 
  # it '@zones.access' do
  #   @zones.access.should_not == nil
  # end
  # 
  # it '@zones.access_status' do
  #   @zones.access_status.should == nil
  # end
  # 
  # it '@zones.company_alias' do
  #   @zones.company_alias.should == NETDNA_COMPANY_ALIAS && @zones.company_alias.should_not == nil
  # end
  # 
  # it '@zones.consumer_key' do
  #   @zones.consumer_key.should == NETDNA_CONSUMER_KEY && @zones.consumer_key.should_not == nil
  # end
  # 
  # it '@zones.consumer_secret' do
  #   @zones.consumer_secret.should == NETDNA_CONSUMER_SECRET && @zones.consumer_secret.should_not == nil
  # end
  
  ## list_zones
  ##########################################
  it '@zones.list_zones w/out parameters' do
    list_zones_response = {"code"=>200, "data"=>{"page"=>1, "pages"=>0, "page_size"=>"50", "current_page_size"=>0, "total"=>0, "zones"=>[]}}
    response = @zones.list_zones
    result   = (list_zones_response == response)
    result.should == true && response.should_not == nil
  end
  
  it '@zones.list_zones WITH parameters(page: 2) response should return' do
    list_zones_response = {"code"=>200, "data"=>{"page"=>"2", "pages"=>0, "page_size"=>"50", "current_page_size"=>-50, "total"=>0, "zones"=>[]}}
    response = @zones.list_zones(page: 2)
    result   = (list_zones_response == response)
    result.should == true && response.should_not == nil
  end

  # ## zone_summary 
  # ##########################################
  # it '@zones.zone_summary w/out parameters' do
  #   @zones.zone_summary.should_not == nil
  # end
  # 
  # it '@zones.zone_summary WITH parameters for [:pull]' do
  #   pending "@zones.zone_summary with [:pull] parameters"
  # end
  # it '@zones.zone_summary WITH parameters for [:push]' do
  #   pending "@zones.zone_summary with [:push] parameters"
  # end
  # it '@zones.zone_summary WITH parameters for [:vod]' do
  #   pending "@zones.zone_summary with [:vod] parameters"
  # end
  # it '@zones.zone_summary WITH parameters for [:live]' do
  #   pending "@zones.zone_summary with [:live] parameters"
  # end
  # 
  # ## zone_count
  # ##########################################
  # it '@zones.zone_count w/out parameters' do
  #   @zones.zone_count.should_not == nil
  # end
    
end



















