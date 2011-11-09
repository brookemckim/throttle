module Throttle
  module Ipfw
    def ipfw(args)
      `sudo ipfw #{args}`
    end  
    
    def parse_pipe_id(str)
      if /^\d{5} pipe (\d*) .*$/.match(str)
        Regexp.last_match(1).to_i
      else
        nil
      end    
    end  
  end  
end  