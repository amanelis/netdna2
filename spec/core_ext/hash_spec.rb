require 'spec_helper'
require File.join(File.dirname(__FILE__), '../../', 'lib/core_ext/hash')


describe Hash do
  context "to_q" do
    before(:all) do
      @hash_0 = {}
      @hash_1 = {"page"=>1, "pages"=>10, "page_size"=>"50", "current_page_size"=>50, "total"=>494}
      @hash_2 = {page: 1, pages: 10, page_size: 50, current_page_size: 50, total: 494}
      @result = "page=1&pages=10&page_size=50&current_page_size=50&total=494"
      @wrong  = "page=1&pages=10&page_size=50&current_page_size=50&total=494&"
    end
    
    it "should return '' if an empty or nil {} is called" do
      method = @hash_0.to_q
      method.should == '' && method.class.should == String
    end
    
    it "should return a correctly formatted response for a 1.8.7 formatted Hash:{}" do
      method = @hash_1.to_q
      method.should == @result && method.class.should == String
    end
    
    it "should return a correctly formatted response for a 1.9.2 formatted Hash:{}" do
      method = @hash_2.to_q
      method.should == @result && method.class.should == String
    end
    
    it "should not return a string with a trailing '&' for the .chomp! method should alter this - 1.8.7 Hash:{}" do
      method = @hash_1.to_q
      method.should_not == @wrong
    end
    
    it "should not return a string with a trailing '&' for the .chomp! method should alter this - 1.9.2 Hash:{}" do
      method = @hash_2.to_q
      method.should_not == @wrong
    end
    
  end
end