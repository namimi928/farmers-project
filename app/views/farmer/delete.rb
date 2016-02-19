class FarmerDeleteView

  attr_accessor :farmer
  
  def initialize(farmer)
    @farmer = farmer.name
  end
  
  def render
    puts "Thank's for being apart of the co-op, #{farmer}. Goodbye!"
  end

end