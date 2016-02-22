require 'pry'

require_relative '../config/environment.rb'
require_relative '../tools/sql_runner.rb'

action = 'something'
until action == 'exit'
    puts 'Welcome to the co-op, Farmer! What ya wanna do? [register, unregister, find farmer, see farmers, add crops]'
    action = gets.chomp
    case action
        when 'register'
            farmer = FarmerController.new.register
            FarmerController.new.create(farmer)
        when 'unregister'
            puts 'What\'s your name, sir?'
            farmer_controller = FarmerController.new.delete
        when 'find farmer'
            puts 'What\'s the name of the farmer are you looking for?'
            farmer_controller = FarmerController.new.show
        when 'see farmers'
            FarmerController.new.index
        when 'add crops'
            crop = CropController.new.register
            CropController.new.create(crop)  
    end
end  