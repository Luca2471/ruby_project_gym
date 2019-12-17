require_relative('../db/sql_runner')

class GymClass

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
    sql = "INSERT INTO gym_classes
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
      id = results.fisrt['id']
      @id = id
  end

  def update()
    sql = "UPDATE gym_classes
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
      values = [@name, @time, @human_id, @membership_id]
      SqlRunner.run( sql, values )
  end

  def self.all
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run( sql )
    return results.map { |gym_class| GymClass.new( gym_class ) }
  end

  def self.find( id )
    sql = "SELECT * FROM gym_classes
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return GymClass.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM gym_classes"
    SqlRunner.run( sql )
  end

  def human()
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [@human_id]
    results = Sqlrunner.run( sql, values )
    return Human.new( results.first )
  end

  def membership()
    sql = "SELECT * FROM memership
    WHERE id = $1"
    values = [@membership_id]
    results = Sqlrunner.run( sql, values )
    return Membership.new( result.first )
  end

  def self.destroy(id)
    sql = "DELETE FROM gym_classes
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
