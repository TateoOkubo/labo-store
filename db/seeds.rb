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

type = [ Type.find_or_create_by(name: "Ice Cream"), Type.find_or_create_by(name: "Cup Noodle")]
puts "Type_seeds OK"


10.times do |n|
  name = Faker::Food.ingredient
  price = Faker::Number.number(4)
  
  item = Item.find_or_create_by(name: name, price: price)
  item.type = type[n % Type.count]
  item.save
  # typeのセッティング
  print "."
end

puts "\n-> Item_seeds OK"

# ユーザー
admin = User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)
admin.cart = Cart.create()
print "."
10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false).cart = Cart.create()
  print "."
end
puts "\n-> User_seeds and Cart_seeds OK!!"

#itemを保存しておく
items = Item.all

Cart.all.each do |c|
  rand_val = rand(Item.count) + 1
  
  #カートに入れるitemの種類はランダム個でランダムな数を入れる
  rand_val.times do |i|
    in_item_num = rand(3) + 1
    
    in_item_num.times do |j|
      c.add(items[i])
    end
  end
  
  print "."
end

puts "\n -> LineItem_seeds OK!!"



