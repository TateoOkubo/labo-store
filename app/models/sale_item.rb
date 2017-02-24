class SaleItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :item
  
  def price
    item = Item.find(item_id)
    item.price
  end
  
  def name 
    item = Item.find(item_id)
    item.name
  end
  
  def image
    item = Item.find(item_id)
    item.image
  end
  
  # 商品の金額を計算
  def fee
    return price * quantity
  end
end
