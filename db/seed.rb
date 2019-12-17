require_relative( "../models/gym_class.rb" )
require_relative( "../models/human.rb" )
require_relative( "../models/membership.rb")

require('pry')

GymClass.delete_all()
Human.delete_all()
Membership.delete_all()

human1 = Human.new({
  "first_name" => "Keanu",
  "surname" => "Reeves",
  "age" => 55 })
human2 = Human.new({
  "first_name" => "Arnold",
  "surname" => "Schwarzenegger",
  "age" => 72 })
human3 = Human.new({
  "first_name" => "Uma",
  "surnmae" => "Thurman",
  "age" => 49 })

human1.save()
human2.save()
human3.save()

gym_class1 = GymClass.new({
  "name" => "Zumba",
  "time" => "10:30am" })
gym_class2 = GymClass.new({
  "name" => "Kickboxing",
  "time" => "5:30pm" })
gym_class3 = GymClass.new({
  "name" => "spin",
  "time" => "3:pm" })

gym_class1.save()
gym_class2.save()
gym_class3.save()

membership = Membership.new({"price" => 25.00})

membership.save()

binding.pry
nil
