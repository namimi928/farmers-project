require 'bundler/setup'
require_relative '../tools/sql_runner.rb'

Bundler.require

DB = {:conn => SQLite3::Database.new("farmers.db")}
sql_runner = SQLRunner.new(DB[:conn])

# sql_runner.execute_create_sql
# sql_runner.execute_data

require_all 'app/'
