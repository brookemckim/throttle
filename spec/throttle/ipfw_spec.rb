require 'spec_helper'

describe Throttle::Ipfw do
  before do
    class Ipfw
      extend Throttle::Ipfw
    end  
  end  
  
  it "should return pipe id" do
    Ipfw.parse_pipe_id('00200 pipe 1 ip from any to any').must_equal(1)
  end
  
  it "should return nil when there is no pipe id" do
    Ipfw.parse_pipe_id("00200 pipe ip from any to any").must_be_nil
  end  
end
