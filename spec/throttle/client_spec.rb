require 'spec_helper'

describe Throttle::Client do
  before do
    @client = Throttle::Client.new
    @pipe   = Throttle::Pipe.new( {:id => 1, :bandwidth => '100Kbp/s'} )
  end  
  
  it "should return current pipe limit" do
    Throttle::Pipe.stubs(:all).returns( [ @pipe ] )
    
    @client.status.must_equal('100Kbp/s')
  end 
  
  it "should return no limits if there are no pipes" do
    Throttle::Pipe.stubs(:all).returns([])
    
    @client.status.must_equal('No Limits.')
  end   
  
  it "should return status after reset" do
    Throttle::Pipe.stubs(:reset).returns(nil)
    Throttle::Pipe.stubs(:all).returns([])
    
    @client.status.must_equal('No Limits.')
  end  
  
  it "should return status after limit" do
    bandwidth = '100Kbps'
    @pipe.bandwidth = bandwidth
    
    Throttle::Pipe.stubs(:reset).returns(nil)
    Throttle::Pipe.any_instance.stubs(:set).returns(nil)
    
    Throttle::Pipe.stubs(:all).returns( [ @pipe ] )
    
    @client.limit(bandwidth).must_equal(bandwidth)
  end  
end  