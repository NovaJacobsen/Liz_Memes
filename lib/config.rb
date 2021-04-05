class InvalidConfig < StandardError
end

class Config
  def initialize(config_data)
    @data = config_data
  end
  
  def random_structure
    fetch(:structures).sample
  end
  
  def expand(structure)
   structure
   .split(/\b/)
   .map { |word| parts(word).sample }
   .join
  end
  
  private
  
  def fetch(key)
    @data.fetch(key.to_s) { raise InvalidConfig, "Config must have key: #{key}" }
  end
 
   def parts(part_name)
     fetch(:parts).fetch(part_name.to_s) { [part_name.to_s] }
   end
end
	