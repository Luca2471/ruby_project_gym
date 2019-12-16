require_relative('../db/sql_runner')

class Class

  attr_reader( :id)
  attr_accessor( :name, :type )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @time = options['time'].to_s if options['time']
    @human_id = options['human_id'].to_i
    @membership_id = options['membership_id'].to_i
  end

  def save()
    sql = "INSERT INTO classes
    (
      time
      )
      VALUES
      (
        $1
        )
      RETURNING id"
  end

  def self.all()
    sql = "SELECT * FROM  classes"
    result = SqlRunner.run( sql )
    return result.map { |hash| Classe.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM  classes
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values )
    return Classe.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM classes"
    SqlRunner.run( sql )
  end

  def human()
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [@human_id]
    result = Sqlrunner.run( sql, values )
    return Human.new( result.first )
  end

  def membership()
    sql = "SELECT * FROM memership
    WHERE id = $1"
    values = [@membership_id]
    result = Sqlrunner.run( sql, values )
    return Membership.new( result.first )
  end

  def self.destroy(id)
    sql = "DELETE DROM classes
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values)
  end

end
