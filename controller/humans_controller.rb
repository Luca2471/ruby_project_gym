require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/human.rb')
require_relative( '../models/membership.rb')
require_relative( '../models/session.rb')
also_reload( '../models/*' )

get '/humans' do
  @humans = Human.all()
  erb (:"humans/index")
end

get '/humans/new' do
  @memberships = Membership.all
  erb(:"humans/new")
end

post '/humans' do
  Human.new(params).save
  redirect to '/humans'
end

get '/humans/:id' do
  @human = Human.find(params['id'])
  erb(:"humans/show")
end

get '/humans/:id/edit' do
  @human = Human.find(params['id'])
  @memberships = Membership.all
  erb(:"humans/edit")
end

post '/humans/:id' do
  human = Human.new(params)
  human.update
  redirect to "/humans"
end

post '/humans/:id/delete' do
  Human.delete(params['id'])
  redirect to '/humans'
end
