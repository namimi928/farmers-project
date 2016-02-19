require 'pry'

class Farmer
  
  attr_accessor :name
  extend Collectable

  @@farmers = []

  def initialize(name)
      @name = name
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

end
