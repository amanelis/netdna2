require 'spec_helper'
require 'faker'

describe NetDna2::Zones do
  before(:all) do
    # Build the zone object
    @zone = NetDna2::Zones.new 
    
    # Purge all the zones before a real test
    @zone.list_zones['data']['zones'].collect { |z| @zone.delete_pull_zone(z['id']) }.to_a.flatten
  end
  
  it '.initialize' do
    @zone.should_not == nil
  end
  
  it '@zone.access' do
    @zone.access.should_not == nil
  end
  
  it '@zone.access_status' do
    @zone.access_status.should == nil
  end
  
  it '@zone.company_alias' do
    @zone.company_alias.should == NETDNA_COMPANY_ALIAS && @zone.company_alias.should_not == nil
  end
  
  it '@zone.consumer_key' do
    @zone.consumer_key.should == NETDNA_CONSUMER_KEY && @zone.consumer_key.should_not == nil
  end
  
  it '@zone.consumer_secret' do
    @zone.consumer_secret.should == NETDNA_CONSUMER_SECRET && @zone.consumer_secret.should_not == nil
  end
  
  ## list_zones
  ##########################################
  it '@zone.list_zones w/out parameters' do
    list_zones_response = {"code"=>200, "data"=>{"page"=>1, "pages"=>0, "page_size"=>"50", "current_page_size"=>0, "total"=>0, "zones"=>[]}}
    response = @zone.list_zones
    result   = (list_zones_response == response)
    response.should_not == nil && result.should == true
  end
  
  # it '@zone.list_zones WITH parameters(page: 2) response should return' do
  #   list_zones_response = {"code"=>200, "data"=>{"page"=>"2", "pages"=>0, "page_size"=>"50", "current_page_size"=>-50, "total"=>0, "zones"=>[]}}
  #   response = @zone.list_zones(page: 2)
  #   result   = (list_zones_response == response)
  #   result.should == true && response.should_not == nil
  # end
  
  ## zone_summary 
  ##########################################
  it '@zone.zone_summary w/out parameters' do
    @zone.zone_summary.should_not == nil
  end
  
  it '@zone.zone_summary WITH parameters for [:pull]' do
    pending "@zone.zone_summary with [:pull] parameters"
  end
  it '@zone.zone_summary WITH parameters for [:push]' do
    pending "@zone.zone_summary with [:push] parameters"
  end
  it '@zone.zone_summary WITH parameters for [:vod]' do
    pending "@zone.zone_summary with [:vod] parameters"
  end
  it '@zone.zone_summary WITH parameters for [:live]' do
    pending "@zone.zone_summary with [:live] parameters"
  end
  
  ## zone_count
  ##########################################
  it '@zone.zone_count w/out parameters' do
    @zone.zone_count.should_not == nil
  end 
  
  ## list_pull_zones
  ##########################################
  it '@zone.list_pull_zones' do
    result = @zone.list_pull_zones
    result['code'].should == 200 && result['data'].should_not == nil    
  end
  
  ## create_pull_zone
  ##########################################
  it '@zone.create_pull_zone' do 
    result = @zone.create_pull_zone({name: (0...12).map{ ('a'..'z').to_a[rand(26)] }.join, url: "http://#{Faker::Internet.domain_name}"})
    result['code'].should == 201 && result['data'].should_not == nil && result['data']['pullzone'].should_not == nil
  end
  
end