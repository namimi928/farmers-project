require_relative '../config/environment.rb'
require_relative '../tools/seed.rb'

action = 'something'
until action == 'exit'
    puts 'Welcome to the co-op, Farmer! What ya wanna do? [register, unregister, find farmer, see farmers]'
    action = gets.chomp
    case action
        when 'register'
            farmer_name = FarmerController.new.register
            FarmerController.new.create(farmer_name)
        when 'unregister'
            puts 'What\'s your name, sir?'
            farmer_name = gets.chomp
            farmer_controller = FarmerController.new.delete(farmer_name)
        when 'find farmer'
            puts 'What farmer are you looking for?'
            farmer_name = gets.chomp
            farmer_controller = FarmerController.new.show(farmer_name)
        when 'see farmers'
            farmers = FarmerController.new.index    
    end
end  