require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controller/classes_controller')
require_relative('./controller/humans_controller')
require_relative('./controller/memberships_controller')

get '/' do
  erb( :index )
end
