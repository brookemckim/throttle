module Throttle
  class Client 
    include Bandwidth
    
    def status
      pipes  = Pipe.all
      status = ""
      pipes.each do |p|
        status += "\n#{p.id} - #{p.bandwidth}"
      end  
      
      status = "No Limits." if status.empty?
      return status
    end
    
    def reset
      Pipe.reset
      status
    end    
     
    def limit(bandwidth)
      Pipe.reset
      
      options = {
        :id        => 1,
        :bandwidth => parse_bandwidth(bandwidth)
      }
            
      Pipe.new(options).set
      status
    end  
  end  
end
  