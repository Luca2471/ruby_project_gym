require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload( '../models/*' )

get '/humans' do
  @humans = Human.all()
  erb (:"humans/index")
end
