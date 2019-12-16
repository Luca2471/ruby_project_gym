require_relative( "../models/classes.rb" )
require_relative( "../models/humans.rb" )
require_relative( "../models/memberships.rb" )
require( "pry" )

Class.delete_all()
Human.delete_all()
Membership.delete_all()

human1 = Human.new({
  "first_name" => "Keanu",
  "surname" => "Reeves",
  "age" => 55
  })

human1.save()

human2 = Human.new({
  "first_name" => "Arnold",
  "surname" => "Schwarzenegger",
  "age" => 72
  })

human2.save()

human3 = Human.new({
  "first_name" => "Uma"
  "surnmae" => "Thurman"
  "age" => 49
  })

human3.save()

class1 = Class.new({
  "name" => "Zumba"
  "time" => "10:30am"
  })

class1.save()

class2 = Class.new({
    "name" => "Kickboxing"
    "time" => "5:30pm"
    })

class2.save

class3 = Class.new({
  "name" => "spin"
  "time" => "3:pm"
  })

class3.save()

membership = Membership.new({
  "price" => 25.00
  })

membership.save()

binding.pry
nil
