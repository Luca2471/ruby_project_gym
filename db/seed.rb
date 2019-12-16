require_relative( "../models/classes.rb" )
require_relative( "../models/humans.rb" )
require_relative( "../models/memberships.rb" )
require( "pry" )

Human.delete_all()
Class.delete_all()
Membership.delete_all()
