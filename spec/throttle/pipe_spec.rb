require 'spec_helper'

describe Throttle::Pipe do
  before do
    @list_output = <<EOF
00100 fwd 127.0.0.1,20559 tcp from any to me dst-port 80 in
00200 pipe 1 ip from any to any
65535 allow ip from any to any
EOF

    @show_output = <<EOF
show_output = <<EOF
00001:  12.000 Mbit/s    0 ms   50 sl. 1 queues (1 buckets) droptail
    mask: 0x00 0x00000000/0x0000 -> 0x00000000/0x0000
BKT Prot ___Source IP/port____ ____Dest. IP/port____ Tot_pkt/bytes Pkt/Byte Drp
  0 tcp   199.47.217.146/80           10.0.1.2/59964 7938  4287713  0    0  66
EOF
  
    @pipe = Throttle::Pipe.new({:id => 100, :bandwidth => '12Mbp/s'})
  end
  
  it "should return pipe" do
    Throttle::Pipe.expects(:ipfw).with('list').returns(@list_output)
    Throttle::Pipe.expects(:ipfw).with('pipe 1 show').returns(@show_output)
    
    pipe = Throttle::Pipe.all[0]
    
    pipe.id.must_equal(1)
    pipe.bandwidth.must_equal("12.000 Mbit/s")
  end
  
  it "should return correct bandwidth" do
    Throttle::Pipe.expects(:ipfw).with('pipe 1 show').returns(@show_output)
    
    Throttle::Pipe.bandwidth(1).must_equal("12.000 Mbit/s")
  end
  
  it "should return nil for unknown pipe" do
    Throttle::Pipe.expects(:ipfw).with('pipe 2 show').returns("ipfw: getsockopt(IP_DUMMYNET_GET): No buffer space available")
    
    Throttle::Pipe.bandwidth(2).must_be_nil
  end     
end  
