class FarmerNewView

  def render
    puts "What's your name, farmer?"
    farmer_name = gets.chomp 
    puts "How old are you?"
    farmer_age = gets.chomp.to_i
    puts "What state do you farm in? (FL, MI, NY CT...)"
    farmer_location = gets.chomp 
    { name: farmer_name, age: farmer_age, location: farmer_location }
  end
    
end