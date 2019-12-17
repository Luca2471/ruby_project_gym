require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload( '../models/*' )

get '/memberships' do
  @gym_classes = GymClass.all()
  erb ( :"memberships/index")
end
