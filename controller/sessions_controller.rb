require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/human.rb')
require_relative( '../models/membership.rb')
require_relative( '../models/session.rb')
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all()
  erb ( :"sessions/index")
end
