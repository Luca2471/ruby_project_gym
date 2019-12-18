require_relative('../db/sql_runner')

class Session

  attr_reader( :id )
  attr_accessor( :name, :time, :human_id, :membership_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @time = options['time']
    @human_id = options['human_id'].to_i
  end

  def save()
    sql = "INSERT INTO sessions
    (
      name,
      time,
      human_id
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@name, @time, @human_id]
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
      human_id
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @time, @human_id, @id]
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


  def humans()
  sql = "SELECT h.* FROM sessions h INNER JOIN memberships m ON m.human_id = h.id WHERE m.session_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |hash| Human.new(hash) }
end


def human()
  sql = "SELECT * FROM humans
  WHERE id = $1"
  values = [@human_id]
  result = SqlRunner.run( sql, values )
  return Human.new( result.first )
end


end
