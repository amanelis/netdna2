require 'spec_helper'


describe NetDna2::Reports do
  before(:all) do
    @reports = NetDna2::Reports.new 
  end
  
  it '.initialize' do
    @reports.should_not == nil
  end
  
  it '@reports.access' do
    @reports.access.should_not == nil
  end
  
  it '@reports.access_status' do
    @reports.access_status.should == nil
  end
  
  it '@reports.company_alias' do
    @reports.company_alias.should == NETDNA_COMPANY_ALIAS && @reports.company_alias.should_not == nil
  end
  
  it '@reports.consumer_key' do
    @reports.consumer_key.should == NETDNA_CONSUMER_KEY && @reports.consumer_key.should_not == nil
  end
  
  it '@reports.consumer_secret' do
    @reports.consumer_secret.should == NETDNA_CONSUMER_SECRET && @reports.consumer_secret.should_not == nil
  end
end