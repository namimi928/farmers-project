class FarmerDeleteView

  attr_accessor :farmers
  
  def initialize(farmers)
    @farmers = farmers
  end

  def confirm
    @farmers.each do |farmer|  
      puts "#{farmer.name}"
      puts "  Age: #{farmer.age}"
      puts "  Location: #{farmer.location}"
      puts "  Registration Id: #{farmer.id}"
    end
    puts "Please confirm your identity by confirming your registration number from the list above."
    gets.chomp
  end
  
  def render
    puts "Thank's for being apart of the co-op, #{farmers}. Goodbye!"
  end

end