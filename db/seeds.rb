# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "seeds runninng..."

# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password_digest: "foobar",
             admin: true)
print "."
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password_digest: password,
              admin: false)
  print "."
end
puts "\n-> User_seeds OK!!"

ItemClass.create(class_name: "Ice Cream")
ItemClass.create(class_name: "Cup Noodle")
puts "ItemClass_seeds OK"

#10.times do |n|
#  name = Faker::Food.ingredient
#  price = Faker::Number.number(4)
  
  #Item.create!(name: name, price: price)
#end

