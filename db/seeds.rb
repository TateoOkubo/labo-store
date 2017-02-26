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

item1 = Item.create(name: "ピノ", price: 100)
item1.type = type[0]
item1.save
item2 = Item.create(name: "パルム", price: 100)
item2.type = type[0]
item2.save

item3 = Item.create(name: "ペヤング", price: 100)
item3.type = type[1]
item3.save

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

#仕入れ
purchase1 = Purchase.create
purchase1.purchase_items.create(item_id: item1.id, quantity: 30)
purchase1.purchase_items.create(item_id: item2.id, quantity: 40)
purchase1.purchase_items.create(item_id: item3.id, quantity: 50)
purchase2 = Purchase.create
purchase2.purchase_items.create(item_id: item1.id, quantity: 3)
purchase2.purchase_items.create(item_id: item2.id, quantity: 2)

purchase3 = Purchase.create
Item.all.each do |i|
  purchase3.purchase_items.create(item_id: i.id, quantity: rand(6) + 1)
  print "."
  end
purchase3.save
puts "\n -> Purchase_seeds OK!!"

#販売
sale1 = Sale.create(user_id: admin.id)
sale1.sale_items.create(item_id: item1.id, quantity: 10)
sale1.sale_items.create(item_id: item2.id, quantity: 15)
sale1.sale_items.create(item_id: item3.id, quantity: 20)
sale2 = Sale.create(user_id: admin.id)
sale2.sale_items.create(item_id: item1.id, quantity: 1)
sale2.sale_items.create(item_id: item2.id, quantity: 2)
sale2.sale_items.create(item_id: item3.id, quantity: 3)
puts "\n -> Sale_seeds OK!!"


