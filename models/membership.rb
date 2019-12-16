require_relative('../db/sql_runner')

class Membership

  attr_reader( :id )
  attr_accessor ( :price )

  def initialize( options )
    @id = options['id'].to_i if options ['id']
    @price = options['id'].to_i if options ['id']
  end

  def save()
    sql = "INSERT INTO memberships
     (
      price
      )
      VALUES
      (
      $1
      )
      RETURNING id"
      values = [@price]
      result = SqlRunner.run( sql, values )
      id = result.first['id']
      @id = id
    end

    def self.all()
      sql = "SELECT * FROM  memberships"
      result = SqlRunner.run(sql)
      return result.map { |hash| Membership.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM memberships
      WHERE id = $1"
      values = [id]
      resut = SqlRunner.run( sql, values )
      return Membership.new( result.first )
    end

    def self.delete_all
      sql = "DELETE FROM memberships"
      SqlRunner.run( sql )
    end

end
