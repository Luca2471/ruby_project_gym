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

  def self.all()
    sql = "SELECT * FROM humans"
    results = SqlRunner.run( sql )
    return results.map { |human| Human.new( human ) }
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

  def format_name
    returning "#{@first_name.capitize} #{@surname.capitalize}"
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
      values = [@first_name, @surname, @age]
      SqlRunner.run( sql, values )
  end

end
