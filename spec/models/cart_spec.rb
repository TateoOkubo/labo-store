require 'spec_helper'

describe Cart do
  it "cartに同じitemを5つaddするとquantityは5" do
    item = Item.create(name: "TestItem")
    cart = Cart.create()
    
    5.times do |n| 
      cart.add(item)
    end
    
    expect(cart.line_items[0].quantity).to eq(5)
  end
  
end