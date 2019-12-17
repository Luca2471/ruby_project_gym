require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('controller/humans_controller')
require_relative('controller/memberships_controller')
also_reload( '../models/*' )

get '/classes' do
  @classes = Class.all()
  erb ( :"classes/index")
end
