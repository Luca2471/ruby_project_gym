require_relative( "../models/session.rb" )
require_relative( "../models/human.rb" )
require_relative( "../models/membership.rb")

require('pry')

Session.delete_all()
Human.delete_all()
Membership.delete_all()

human1 = Human.new({
  "first_name" => "Keanu",
  "surname" => "Reeves",
  "age" => 55})

human2 = Human.new({
  "first_name" => "Arnold",
  "surname" => "Schwarzenegger",
  "age" => 72 })

human3 = Human.new({
  "first_name" => "Uma",
  "surname" => "Thurman",
  "age" => 49 })

human1.save()
human2.save()
human3.save()

membership1 = Membership.new({
  "price" => 25.00,
  "human_id" => human1.id })

membership2 = Membership.new({
  "price" => 25.00,
  "human_id" => human2.id })

membership3 = Membership.new({
  "price" => 25.00,
  "human_id" => human3.id })

membership1.save()
membership2.save()
membership3.save()


session1 = Session.new({
  "name" => "Zumba",
  "time" => "10:30am",
  "human_id" => human1.id,
  "membership_id" => membership1.id })

session2 = Session.new({
  "name" => "Kickboxing",
  "time" => "5:30pm",
  "human_id" => human2.id,
  "membership_id" => membership2.id})

session3 = Session.new({
  "name" => "spin",
  "time" => "3:00pm",
  "human_id" => human3.id,
  "membership_id" => membership3.id })

session1.save()
session2.save()
session3.save()

binding.pry
nil
