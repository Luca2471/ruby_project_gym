require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/human.rb')
require_relative( '../models/membership.rb')
require_relative( '../models/session.rb')
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all()
  erb( :"sessions/index")
end

get '/sessions/new' do
  @sessions = Session.all
  @humans = Human.all

  erb(:"sessions/new")
end

post '/sessions' do
  Session.new(params).save
  redirect to '/sessions'
end

get '/sessions/:id' do
  @session = Session.find(params['id'])
  erb(:"sessions/show")
end

get '/sessions/:id/edit' do
  @session = Session.find(params['id'])
  @humans = Human.all
  erb(:"sessions/edit")
end

post '/sessions/:id' do
  session = Session.new(params)
  session.update
  redirect to "/sessions"
end

post '/sessions/:id/delete' do
  Session.delete(params['id'])
  redirect to '/sessions'
end
