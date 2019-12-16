require_relative('../db/sql_runner')

class Human

  attr_reader( :id )
  attr_accessor( :first_name, :surname, :age )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @surname = oprtions['surname']
    @age = oprtions['age'].to_i if options['age']
  end

  def save()
    sql = "INSERT INTO Classes
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
      result = SqlRunner.run( sql, values)
      id = result.first['id']
      @id = id
  end

  def self.all()
    sql = "SELECT * FROM humans"
    result = SqlRunner.run( sql )
    return result.map { |hash| Human.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values)
    return Human.new( result.first )
  end

  def self.delete_all
    sql = "DELETE FROM humans"
    SqlRunner.run( sql )
  end

  def format_name
    returning "#{@first_name.capitize} #{@surname.capitalize}"
  end

end
