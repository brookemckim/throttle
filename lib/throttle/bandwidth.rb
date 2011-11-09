module Throttle
  module Bandwidth
    def parse_bandwidth(str)
      ammount = nil
      units  = "KBp/s"
            
      if /(\d*)/.match(str)
        ammount = Regexp.last_match(0)
        
        if /((K|M|k|m)(b|B)(p|P))/.match(str)
          units  = Regexp.last_match(0)
          units += '/s'
        end  
        
        "#{ammount}#{units}"
      else
        nil
      end    
    end  
  end  
end
  