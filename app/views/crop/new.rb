class CropNewView

  def render
    puts "What's the crop?"
    crop_name = gets.chomp 
    puts "What's your price?"
    crop_price = gets.chomp.to_i
    puts "What's your Farmer ID?"
    farmer_id = gets.chomp.to_i
    { name: crop_name, price: crop_price, farmer_id: farmer_id }
  end
    
end