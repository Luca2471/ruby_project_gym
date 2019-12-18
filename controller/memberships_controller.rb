require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/human.rb')
require_relative( '../models/membership.rb')
require_relative( '../models/session.rb')
also_reload( '../models/*' )

get '/memberships' do
  @membershps = Mebership.all()
  erb ( :"memberships/index")
end

get '/memberships/new' do
  @memberships = Membership.all
  erb(:"memberships/new")
end

post '/memberships' do
  Membership.new(params).save
  redirect to '/humans'
end

get '/memberships/:id' do
  @membership = Membership.find(params['id'])
  erb(:"memberships/show")
end

get '/memberships/:id/edit' do
  @membership = Membership.all(params['id'])
  @humans = Human.all
  erb(:"memberships/edit")
end

post 'memberships/:id' do
  membership = Membership.new(params)
  humans.update
  redirect to "/memberships"
end

post 'memberships/:id/delete' do
  Membership.delete(params['id'])
  redirect to '/memberships'
end
