require_relative('../db/sql_runner')

class Membership

  attr_reader( :id )
  attr_accessor( :price,  :human_id)

  def initialize( options )
    @id = options['id'].to_i if options ['id']
    @price = options['price'].to_i
    @human_id = options['human_id'].to_i
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO memberships
     (
      price,
      human_id,
      session_id
      )
      VALUES
      (
      $1, $2, $3
      )
      RETURNING id"
      values = [@price, @human_id, @session_id]
      results = SqlRunner.run( sql, values )
      id = results.first['id']
      @id = id
    end

    def self.all()
      sql = "SELECT * FROM  memberships"
      results = SqlRunner.run(sql)
      return results.map { |membership| Membership.new( membership ) }
    end

    def self.find( id )
      sql = "SELECT * FROM memberships
      WHERE id = $1"
      values = [id]
      resut = SqlRunner.run( sql, values )
      return Membership.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM memberships"
      SqlRunner.run( sql )
    end

    def update()
      sql = "UPDATE memberships
      SET
      (
        price,
        human_id,
        session_id
        ) =
        (
          $1, $2, $3
        )
        WHERE id = $4"
        values = [@price, @human_id, @session_id, @id]
        SqlRunner.run( sql, values )
    end

    def self.delete(id)
      sql = "DELETE FROM memberships
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql ,values )
    end

    def human()
      sql = "SELECT * FROM humans
      WHERE id = $1"
      values = [@human_id]
      result = SqlRunner.run( sql, values )
      return Human.new( result.first )
    end

    def session()
      sql = "SELECT * FROM sessions
      WHERE id = $1"
      values = [@session_id]
      result = SqlRunner.run( sql, values )
      return Session.new( result.first )
    end

end
