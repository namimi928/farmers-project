require 'pry'

class Farmer
  
  attr_accessor :name, :age, :location
  attr_reader :id

  extend Collectable

  @@farmers = []

  def initialize(name, age, location, id = nil)
      @name = name
      @age = age
      @location = location
      @id = id
      @@farmers << self
  end

  def self.all
    @@farmers
  end

  def self.count
    @@farmers.length
  end

  def self.unregister(farmer)
    @@farmers.delete(farmer)
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
    self.new(row[1], row[2], row[3], row[0])
  end

  def self.create(attributes)
    farmer = Farmer.new(attributes[:name], attributes[:age], attributes[:location])
    farmer.save
    farmer
  end


end
