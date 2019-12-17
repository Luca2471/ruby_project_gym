require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('controller/classes_controller')
require_relative('controller/memberships_controller')
also_reload( '../models/*' )

get '/humans' do
  @humans = Human.all()
  erb (:"humans/index")
end
