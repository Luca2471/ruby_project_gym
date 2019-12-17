require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload( '../models/*' )

get '/sessions' do
  @session = Session.all()
  erb ( :"classes/index")
end
