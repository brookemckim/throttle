require 'spec_helper'

describe Throttle do
  before do
    @throttle = Throttle.new
  end

  it "should instansiate a Client class" do
    @throttle.must_be_kind_of(Throttle::Client)
  end
end
