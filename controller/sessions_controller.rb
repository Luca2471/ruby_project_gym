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

get '/sessions/new' do
  @sessions = Session.all
  erb(:"memberships/new")
end

post '/sessions' do
  Session.new(params).save
  redirect to '/sessions'
end

get '/sessions/id' do
  @sessin = Session.find(params['id'])
  erb(:"session/show")
end

get '/sessions/:id/edit' do
  @session = Session.all(params['id'])
  @human = Human.all
  erb(:"sessions/edit")
end

post '/sessions/:id' do
  session = Session.new(params)
  session.update
  redirect to "/sessions/#{params['id']}"
end

post '/sessions/:id/delete' do
  session = Session.find(params['id'])
  session.delete
  redirect to '/sessions'
end
