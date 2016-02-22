require_relative '../config/environment.rb'
require_relative 'sql_runner.rb'

def reload!
  load '../config/environment.rb'  
end


Pry.start