require_relative '../config/environment'

class SQLRunner

  attr_accessor :db

  def initialize(db)
    @db = db
  end

  def execute_create_sql
    sql = File.read('create.sql')
    @db.execute_batch(sql)
  end

  def execute_data
    sql = File.read('data.sql')
    @db.execute_batch(sql)
  end

end
