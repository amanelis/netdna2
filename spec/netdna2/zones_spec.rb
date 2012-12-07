require 'spec_helper'
require 'faker'

describe NetDna2::Zones do
  before(:all) do
    # Build the zone object
    @zone = NetDna2::Zones.new 
    
    # Delete all zones
    @zone.list_zones['data']['zones'].collect { |z|  
      p " == Deleting zone #{z['id']}"
      @zone.delete_pull_zone(z['id']) 
    }
    
    # Delete all pull zones before a real test
    @zone.list_pull_zones['data']['pullzones'].collect { |z|  
      p " == Deleting pull zone #{z['id']}"
      @zone.delete_pull_zone(z['id']) 
    }
    
    # Delete all push zones before a real test
    @zone.list_push_zones['data']['pushzones'].collect { |z|  
      p " == Deleting push zone #{z['id']}"
      @zone.delete_pull_zone(z['id']) 
    }
  end
  
  # it '.initialize' do
  #   @zone.should_not be_nil
  # end
  # 
  # it '@zone.access' do
  #   @zone.access.should_not be_nil
  # end
  # 
  # it '@zone.access_status' do
  #   @zone.access_status.should_not be_nil
  # end
  # 
  # it '@zone.company_alias' do
  #   @zone.company_alias.should == NETDNA_COMPANY_ALIAS && @zone.company_alias.should_not be_nil
  # end
  # 
  # it '@zone.consumer_key' do
  #   @zone.consumer_key.should == NETDNA_CONSUMER_KEY && @zone.consumer_key.should_not be_nil
  # end
  # 
  # it '@zone.consumer_secret' do
  #   @zone.consumer_secret.should == NETDNA_CONSUMER_SECRET && @zone.consumer_secret.should_not be_nil
  # end
  # 
  # ## list_zones
  # ##########################################
  # it '@zone.list_zones w/out parameters' do
  #   list_zones_response = {"code"=>200, "data"=>{"page"=>1, "pages"=>0, "page_size"=>"50", "current_page_size"=>0, "total"=>0, "zones"=>[]}}
  #   response = @zone.list_zones
  #   result   = (list_zones_response == response)
  #   response.should_not be_nil && result.should == true
  # end 
  # 
  # ## zone_summary 
  # ##########################################
  # it '@zone.zone_summary w/out parameters' do
  #   @zone.zone_summary.should_not == nil
  # end
  # 
  # it '@zone.zone_summary WITH parameters for [:pull]' do
  #   pending "@zone.zone_summary with [:pull] parameters"
  # end
  # it '@zone.zone_summary WITH parameters for [:push]' do
  #   pending "@zone.zone_summary with [:push] parameters"
  # end
  # it '@zone.zone_summary WITH parameters for [:vod]' do
  #   pending "@zone.zone_summary with [:vod] parameters"
  # end
  # it '@zone.zone_summary WITH parameters for [:live]' do
  #   pending "@zone.zone_summary with [:live] parameters"
  # end
  # 
  # ## zone_count
  # ##########################################
  # it '@zone.zone_count w/out parameters' do
  #   result = @zone.zone_count
  #   result['code'].should == 200 && result['data'].should_not be_nil
  # end 
  # 
  # ## list_pull_zones
  # ##########################################
  # it '@zone.list_pull_zones' do
  #   result = @zone.list_pull_zones
  #   result['code'].should == 200 && result['data'].should_not be_nil
  # end
  # 
  # ## create_pull_zone
  # ##########################################
  # it '@zone.create_pull_zone' do 
  #   result = @zone.create_pull_zone({name: (0...12).map{ ('a'..'z').to_a[rand(26)] }.join, url: "http://#{Faker::Internet.domain_name}"})
  #   
  #   puts ''
  #   puts 'CREATE'
  #   puts result.inspect
  #   puts 'CREATE'
  #   puts ''
  #   
  #   result['code'].should == 201 && result['data'].should_not be_nil && result['data']['pullzone'].should_not be_nil
  # end
  
  ## pull_zone_coount
  it 'should return the pull zone count' do
    result = @zone.pull_zones_count
    result.should_not be_nil
  end
  
  context 'PullZone CRUD' do
    before(:all) do
      @pullzone = @zone.create_pull_zone({
        name: (0...12).map{ ('a'..'z').to_a[rand(26)] }.join, 
        url: "http://#{Faker::Internet.domain_name}"})
    end
    
    it 'should create a valid pullzone' do      
      @pullzone.should_not be_nil
    end
    
    it 'should return successfully on a valid pull zone get' do
      result = @zone.get_pull_zone(@pullzone['data']['pullzone']['id'])
      result.should_not be_nil
    end
    
    it 'should return successfully on a valid pull zone update' do
      result = @zone.update_pull_zone(@pullzone['data']['pullzone']['id'])
      result.should_not be_nil
    end
    
    it 'should return successfully on a valid pull zone enable' do
      result = @zone.enable_pull_zone(@pullzone['data']['pullzone']['id'])
      result.should_not be_nil
    end
    
    it 'should return successfully on a valid pull zone disable' do
      result = @zone.disable_pull_zone(@pullzone['data']['pullzone']['id'])
      result.should_not be_nil
    end
    
    it 'should return successfully on a valid pull zone delete' do
      result = @zone.delete_pull_zone(@pullzone['data']['pullzone']['id'])
      result.should_not be_nil
    end
    
    after(:all) do
      @zone.delete_pull_zone(@pullzone['data']['pullzone']['id'])
    end
  end
  
end