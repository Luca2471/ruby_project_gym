require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('controller/classes_controller')
require_relative('controller/humans_controller')
also_reload( '../models/*' )

get '/memberships' do
  @classes = Class.all()
  erb ( :"memberships/index")
end
