class FarmerShowView

  attr_accessor :farmers
  
  def initialize(farmers)
    @farmers = farmers
  end
  
  def render
    return "We have no farmers under that name!" if @farmers.length == 0
    # binding.pry
    puts "Here\'s a list of all farmers named #{@farmers.first.name}"
        @farmers.each do |farmer|  
          puts "#{farmer.name}"
          puts "  Age: #{farmer.age}"
          puts "  Age: #{farmer.location}"
        end
  end
end