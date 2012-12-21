require 'spec_helper'


describe NetDna2::Reports do
  before(:all) do
    @report = NetDna2::Reports.new 
  end
  
  it '.initialize' do
    @report.should_not == nil
  end
  
  it '@report.access' do
    @report.access.should_not == nil
  end
  
  it '@report.access_status' do
    @report.access_status.should_not == nil
  end
  
  it '@report.company_alias' do
    @report.company_alias.should == NETDNA_COMPANY_ALIAS && @report.company_alias.should_not == nil
  end
  
  it '@report.consumer_key' do
    @report.consumer_key.should == NETDNA_CONSUMER_KEY && @report.consumer_key.should_not == nil
  end
  
  it '@report.consumer_secret' do
    @report.consumer_secret.should == NETDNA_CONSUMER_SECRET && @report.consumer_secret.should_not == nil
  end
  
  it '@report.list_zone_stats - (hourly, daily, monthly)' do
    @report.list_zone_stats(:hourly).should_not   == nil &&
    @report.list_zone_stats(:daily).should_not    == nil && 
    @report.list_zone_stats(:monthly).should_not  == nil
  end
  
  it '@report.list_zone_stats_by_type - push (hourly, daily, monthly)' do
    @report.list_zone_stats_by_type(:push, :hourly).should_not  == nil &&
    @report.list_zone_stats_by_type(:push, :daily).should_not   == nil &&
    @report.list_zone_stats_by_type(:push, :monthly).should_not == nil
  end
  
  it '@report.list_zone_stats_by_type - pull (hourly, daily, monthly)' do
    @report.list_zone_stats_by_type(:pull, :hourly).should_not  == nil &&
    @report.list_zone_stats_by_type(:pull, :daily).should_not   == nil &&
    @report.list_zone_stats_by_type(:pull, :monthly).should_not == nil
  end
  
  it '@report.list_zone_stats_by_type - vod (hourly, daily, monthly)' do
    @report.list_zone_stats_by_type(:vod, :hourly).should_not  == nil &&
    @report.list_zone_stats_by_type(:vod, :daily).should_not   == nil &&
    @report.list_zone_stats_by_type(:vod, :monthly).should_not == nil
  end
  
  it '@report.list_zone_stats_by_type - live (hourly, daily, monthly)' do
    @report.list_zone_stats_by_type(:live, :hourly).should_not  == nil &&
    @report.list_zone_stats_by_type(:live, :daily).should_not   == nil &&
    @report.list_zone_stats_by_type(:live, :monthly).should_not == nil
  end
  
  it '@report.list_stats_per_zone - (hourly, daily, monthly)' do
    @report.list_stats_per_zone(1, :hourly).should_not  == nil &&
    @report.list_stats_per_zone(1, :daily).should_not   == nil &&
    @report.list_stats_per_zone(1, :monthly).should_not == nil
  end
end