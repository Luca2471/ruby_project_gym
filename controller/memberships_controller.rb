require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload( '../models/*' )

get '/memberships' do
  @membershps = Mebership.all()
  erb ( :"memberships/index")
end
