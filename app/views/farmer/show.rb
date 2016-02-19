class FarmerShowView

  attr_accessor :name
  
  def initialize(farmer)
    @name = farmer.name
  end
  
  def render
    puts "Here is #{@name}."
  end
    
end