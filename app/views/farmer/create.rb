class FarmerCreateView

  attr_accessor :farmer
  
  def initialize(farmer)
    @farmer = farmer
  end
  
  def render
    puts "Great! You are now a registered farmer, #{farmer.name}."
  end

end