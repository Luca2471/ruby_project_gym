require_relative('../db/sql_runner')

class Session

  attr_reader( :id )
  attr_accessor( :name, :time, :human_id, :membership_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @time = options['time']
    @human_id = options['human_id'].to_i
    @membership_id = options['membership_id'].to_i
  end

  def save()
    sql = "INSERT INTO sessions
    (
      name,
      time,
      human_id,
      membership_id
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
      values = [@name, @time, @human_id, @membership_id]
      results = SqlRunner.run( sql, values)
      id = results.first['id']
      @id = id
  end

  def update()
    sql = "UPDATE sessions
    SET
    (
      name,
      time,
      human_id,
      membership_id
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @time, @human_id, @membership_id, @id]
      SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Session.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Session.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM sessions"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM sessions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
