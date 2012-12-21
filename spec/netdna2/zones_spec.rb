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
  
  describe "#initialize" do
    subject { @zone }
    
    context "when super called with three correct parameters {key, secret, alias}" do
      it { should_not be_nil }
    end
  end

  describe "#access" do
    subject { @zone.access }
    
    context "when there is a successful authentication" do
      it { should_not be_nil }
    end
  end
  
  describe "#access_status" do
    subject { @zone.access_status }
    
    context "when there is a successful authentication" do
      it { should eq("200") }
    end
  end
  
  describe "#company_alias" do
    subject { @zone.company_alias }
    
    context "when a String[company_alias] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_COMPANY_ALIAS) }
    end
  end
  
  describe "#consumer_key" do
    subject { @zone.consumer_key }
    
    context "when a String[consumer_key] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_CONSUMER_KEY) }
    end
  end
  
  describe "#consumer_secret" do
    subject { @zone.consumer_secret }
    
    context "when a String[consumer_secret] is passed on intialization" do
      it { should_not be_nil }
      it { should eq(NETDNA_CONSUMER_SECRET) }
    end
  end
  
   describe "#list_zones" do
     subject { @zone.list_zones }
     
     context "when listing the zones without parameters" do
       it { should_not be_nil }
       
       it "has the correct response code" do
         subject['code'].should eq(200)
       end
       
       it "has the correct json representation" do
         list_zones_response  = {"code"=>200, "data"=>{"page"=>1, "pages"=>0, "page_size"=>"50", "current_page_size"=>0, "total"=>0, "zones"=>[]}}         
         (list_zones_response == subject).should == true
       end
     end
   end
   
   describe "#zone_summary" do
     subject { @zone.zone_summary }
     
     context "when called WITH OUT any parameters" do
       it { should_not be_nil }
     end
     
     context "when called WITH parameters for [:pull]" do
       pending "@zone.zone_summary with [:pull] parameters"
     end
     
     context "when called WITH parameters for [:push]" do
       pending "@zone.zone_summary with [:push] parameters"
     end
     
     context "when called WITH parameters for [:vod]" do
       pending "@zone.zone_summary with [:vod] parameters"
     end
     
     context "when called WITH parameters for [:live]" do
       pending "@zone.zone_summary with [:live] parameters"
     end
   end
   
   describe "#zone_count" do
     subject { @zone.zone_count }
     
     context "when called WITH OUT parameters" do
       it "has the correct response code" do
         subject['code'].should eq(200)
       end
       
       it 'has the proper response data' do
         subject['data'].should_not be_nil
       end
     end
   end
   
   describe "#list_pull_zones" do
     subject { @zone.list_pull_zones }
     
     context "when called WITH OUT parameters" do
       it "has the correct response code" do
         subject['code'].should eq(200)
       end
       
       it 'has the proper response data' do
         subject['data'].should_not be_nil
       end
     end
   end
   
   describe "#create_pull_zone" do
     subject { @zone.create_pull_zone({name: (0...12).map{ ('a'..'z').to_a[rand(26)] }.join, url: "http://#{Faker::Internet.domain_name}"}) }
     
     context "when creating a pullzone with a valid name and url" do
       it "has the correct response code" do
         subject['code'].should eq(201)
       end
       
       it 'has the proper response data' do
         subject['data']['pullzone'].should_not be_nil
       end
     end
   end
   
   describe "#pull_zone_coount" do
     context "when requesting the pull_zone_coount" do
       it { should_not be_nil }
     end
   end
   
   describe 'when creating a pullzone' do
     before(:all) do
       @pullzone = @zone.create_pull_zone({name: (0...12).map{ ('a'..'z').to_a[rand(26)] }.join, url: "http://#{Faker::Internet.domain_name}"})
     end
     
     it 'should create a valid pullzone' do      
       @pullzone.should_not be_nil
     end
     
     it 'should return successfully on a valid pull zone get' do
       @zone.get_pull_zone(@pullzone['data']['pullzone']['id']).should_not be_nil
     end
     
     it 'should return successfully on a valid pull zone update' do
       @zone.update_pull_zone(@pullzone['data']['pullzone']['id']).should_not be_nil
     end
     
     it 'should return successfully on a valid pull zone enable' do
       @zone.enable_pull_zone(@pullzone['data']['pullzone']['id']).should_not be_nil
     end
     
     it 'should return successfully on a valid pull zone disable' do
       @zone.disable_pull_zone(@pullzone['data']['pullzone']['id']).should_not be_nil
     end
     
     it 'should return successfully on a valid pull zone delete' do
      @zone.delete_pull_zone(@pullzone['data']['pullzone']['id']).should_not be_nil
     end
     
     after(:all) do
       @zone.delete_pull_zone(@pullzone['data']['pullzone']['id'])
     end
   end
   
end