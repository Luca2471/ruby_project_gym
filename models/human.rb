require_relative('../db/sql_runner')

class Human

  attr_reader( :id )
  attr_accessor( :first_name, :surname, :age )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @surname = options['surname']
    @age = options['age'].to_i if options['age']
  end

  def save()
    sql = "INSERT INTO humans
    (
     first_name,
     surname,
     age
    )
    values
    (
      $1, $2, $3
      )
      RETURNING id"
      values = [@first_name, @surname, @age]
      results = SqlRunner.run( sql, values )
      id = results.first['id']
      @id = id
  end

  def update()
    sql = "UPDATE humans
    SET
    (
      first_name,
      surname,
      age
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@first_name, @surname, @age, @id]
      SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM humans"
    results = SqlRunner.run( sql )
    return results.map { |hash| Human.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Human.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM humans"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM humans
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def format_name
    return "#{@first_name.capitalize} #{@surname.capitalize}"
  end


  def sessions()
  sql = "SELECT s.* FROM sessions s INNER JOIN memberships m ON m.session_id = s.id WHERE m.human_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |hash| Session.new(hash) }
end

def session()
  sql = "SELECT * FROM sessions
  WHERE id = $1"
  values = [@session_id]
  result = SqlRunner.run( sql, values )
  return Session.new( result.first )
end



end
