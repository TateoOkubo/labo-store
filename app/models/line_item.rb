class LineItem < ActiveRecord::Base
  validates :quantity, presence: true
  
  belongs_to :cart
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
  
end
