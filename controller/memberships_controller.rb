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

get '/humans/new' do
  @memberships = Membership.all
  erb(:"humans/new")
end

post '/humans' do
  Human.new(params).save
  redirect to '/humans'
end
