module Throttle
  class Pipe
    attr_accessor :id, :bandwidth, :rule_id

    def self.all
      pipes      = []
      pipe_lines = []
      
      ipfw('list').split("\n").each do |line|
        if /^\d{5} pipe.*$/.match(line)
          pipe_lines << Regexp.last_match(0)
        end  
      end  
      
      pipe_lines.each do |line|
        id        = parse_pipe_id(line)
        bandwidth = Pipe.bandwidth(id)
        
        pipes << Pipe.new({
          :id        => id,
          :bandwidth => bandwidth
        })
      end  
      
      return pipes
    end    

    def self.bandwidth(id)
      output = ipfw("pipe #{id} show")
      
      if /^\d{5}:\W*(\d*\.\d* \S*).*$/.match(output)
        Regexp.last_match(1)
      else
        nil
      end    
    end  
    
    def self.reset
      Pipe.all.each do |pipe|
        pipe.delete
      end  
    end  
    
    def initialize(options = {})
      @id        = options[:id]
      @bandwidth = options[:bandwidth]
    end
    
    def set
      unless rule_id
        ipfw("add pipe #{self.id} ip from any to any")
      end
        
      ipfw("pipe #{id} config bw #{self.bandwidth}")
    end  
    
    def bandwidth
      @bandwidth || "Inactive"
    end  
    
    def rule_id
      @rule_id ||= set_rule_id
    end  
    
    def set_rule_id
      regex = "^(\d{5}) pipe #{self.id}.*$"
      
      if /^(\d{5}) pipe #{self.id}.*$/.match(ipfw("list"))
        Regexp.last_match(1)
      end  
    end  
    
    def delete
      delete_rule
      
      unless @bandwidth.nil?
        ipfw("pipe #{@id} delete")
      end
    end  
    
    def delete_rule
      if rule_id && rule_id != 0
        ipfw("delete #{rule_id}")
      end    
    end  
    
    private
        
    include Ipfw  
    extend  Ipfw
  end  
end
  