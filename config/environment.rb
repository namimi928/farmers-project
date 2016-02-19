require 'bundler/setup'

Bundler.require

DB = {:conn => SQLite3::Database.new("farmers.db")}

require_all 'app/'
