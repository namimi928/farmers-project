require 'pry'

class Crop
  
  attr_accessor :name, :price
  attr_reader :id, :farmer_id

  extend Collectable


  def initialize(attributes, id = nil)
      @name = attributes[:name]
      @price = attributes[:price]
      @farmer_id = attributes[:farmer_id]
      @id = id
  end

 def self.create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS crops (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price INTEGER,
        farmer_id INTEGER
        );
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL 
        INSERT INTO crops ( name, price, farmer_id )
        VALUES ( ?, ?, ? );
        SQL

    x = DB[:conn].execute(sql, self.name, self.price, self.farmer_id)
    binding.pry
  end

end