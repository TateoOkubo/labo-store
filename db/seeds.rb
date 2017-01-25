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
10.times do |n|
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

Type.create(name: "Ice Cream")
Type.create(name: "Cup Noodle")
puts "Type_seeds OK"



10.times do |n|
  name = Faker::Food.ingredient
  price = Faker::Number.number(4)
  
  Item.create!(name: name, price: price)
  print "."
end

puts "\n-> Item_seeds OK"

