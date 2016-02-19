module Collectable
  
  def find_by_name(name)
    sql = <<-SQL 
        SELECT * FROM "#{self}s"
        WHERE name = ?
        SQL
    DB[:conn].execute(sql, name).map do |row|
        self.new_from_db(row)
    end
  end
end