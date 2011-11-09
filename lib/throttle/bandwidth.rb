module Throttle
  module Bandwidth
    def parse_bandwidth(str)
      amount = nil
      units  = "KBp/s"
            
      if /(\d*)/.match(str)
        amount = Regexp.last_match(0).to_i
        
        if /((K|M|k|m)(b|B)(p|P))/.match(str)
          units  = Regexp.last_match(0)
          units.gsub!('P', 'p')
          units.gsub!('/s', '')
          units += '/s'
        end  
        
        # Maximum allowed MBps
        amount = 268 if units == "MBp/s" && amount > 268
        
        "#{amount}#{units}"
      else
        nil
      end    
    end  
  end  
end
  