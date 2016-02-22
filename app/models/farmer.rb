require 'pry'

class Farmer
  
  attr_accessor :name, :age, :location
  attr_reader :id

  extend Collectable

  def initialize(attributes, id = nil)
      @name = attributes[:name]
      @age = attributes[:age]
      @location = attributes[:location]
      @id = id
  end

  def self.all
    sql = <<-SQL 
      SELECT * FROM #{self}s
      SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

  def self.count
    @@farmers.length
  end

  def self.unregister(farmer_id)
    sql = <<-SQL 
      DELETE FROM #{self}s
      WHERE id = ?;
        );
      SQL
    DB[:conn].execute(sql, farmer_id)
  end

  def self.create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS farmers (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER,
        location TEXT
        );
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE "#{self}s" ;
      SQL

    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO "#{self.class}s" ( name, age, location )
      VALUES ( ?, ?, ? )
      SQL

    DB[:conn].execute(sql, self.name, self.age, self.location)
    @id = DB[:conn].execute("SELECT last_insert_rowid() from #{self.class}s")[0][0]
  end

  def self.new_from_db(row)
    self.new({name: row[1], age: row[2], location: row[3]}, row[0])
  end

  def self.create(attributes)
    farmer = Farmer.new(attributes[:name], attributes[:age], attributes[:location])
    farmer.save
    farmer
  end


end
