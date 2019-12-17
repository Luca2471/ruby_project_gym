require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload( '../models/*' )

get '/classes' do
  @gym_classes = GymClass.all()
  erb ( :"classes/index")
end
