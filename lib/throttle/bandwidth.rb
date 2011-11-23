module Throttle
  module Bandwidth
    def parse_bandwidth(str)
      amount = nil
      units  = "KBp/s"
            
      if !(/(\d*)/.match(str).to_s.empty?)
        amount = Regexp.last_match(0).to_i
        
        if /((K|M|k|m)(b|B)(p|P))/.match(str)
          units  = Regexp.last_match(0)
          units.gsub!('P', 'p')
          units.gsub!('/s', '')
          units += '/s'
        end  
        
        # Maximum allowed by ipfw
        if over_limit?(amount, units)
          amount = 268
          units  = "MBp/s"
        end  
        
        "#{amount}#{units}"
      else
        nil
      end    
    end  
    
    private
    
    def over_limit?(amount, units)
      case units
      when "MBp/s"
        true if amount > 268
      when "Mbp/s"
        true if amount > 2144
      when "KBp/s"
        true if amount > 268000
      when "Kbp/s"
        true if amount > 2144000
      end       
    end  
  end  
end
  