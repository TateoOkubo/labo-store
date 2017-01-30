# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#delete model
User.destroy_all
Cart.destroy_all
Item.destroy_all
LineItem.destroy_all
Type.destroy_all
puts "destroy all model"

puts "seeds runninng..."

# ユーザー
admin = User.find_or_create_by(name:  "Example User",
             email: "example@railstutorial.org",
             password_digest: "foobar",
             admin: true)
admin.cart = Cart.create()
print "."
10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.find_or_create_by(name: name,
              email: email,
              password_digest: password,
              admin: false).cart = Cart.create()
  print "."
end
puts "\n-> User_seeds and Cart_seeds OK!!"

type = [ Type.find_or_create_by(name: "Ice Cream"), Type.find_or_create_by(name: "Cup Noodle")]
puts "Type_seeds OK"


10.times do |n|
  name = Faker::Food.ingredient
  price = Faker::Number.number(4)
  
  item = Item.find_or_create_by(name: name, price: price)
  item.type = type[n % 2]
  item.save
  # typeのセッティング
  print "."
end

puts "\n-> Item_seeds OK"

#cart seed ユーザと同じ数用意

#puts "\n-> Cart_seeds OK"


