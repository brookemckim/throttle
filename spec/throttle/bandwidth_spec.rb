require 'spec_helper'

describe Throttle::Bandwidth do
  before do
    class Bandwidth
      extend Throttle::Bandwidth
    end  
  end  
  
  it "should return nil on invalid string" do
    Bandwidth.parse_bandwidth('notabandwidthstring').must_be_nil
  end
  
  it "should return correct bandwidth on properly formed string" do
    Bandwidth.parse_bandwidth('400 Kbps').must_equal('400Kbp/s')
  end  
  
  it "should cap at 268MBp/s" do
    Bandwidth.parse_bandwidth('10000 MBps').must_equal('268MBp/s')
    Bandwidth.parse_bandwidth('9999999 KBps').must_equal('268MBp/s')
  end  
  
  it "should properly format a messy string" do
    Bandwidth.parse_bandwidth('5  Kbp').must_equal('5Kbp/s')
  end  
end
