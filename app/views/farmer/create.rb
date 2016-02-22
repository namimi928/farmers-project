require 'pry'
class FarmerCreateView

  attr_accessor :farmer_id
  
  def initialize(farmer_id)
    @farmer_id = farmer_id
  end
  
  def render
    sql = <<-SQL 
        SELECT * FROM farmers
        WHERE id = #{@farmer_id}
        SQL

    new_farmer = DB[:conn].execute(sql).map do |row| 
        Farmer.new_from_db(row)
    end.first

    puts "Great! You are now a registered farmer:" 
    puts "  #{new_farmer.name}"
    puts "  Age: #{new_farmer.age}"
    puts "  Location: #{new_farmer.location}"
    
  end

end