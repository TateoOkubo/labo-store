class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :item
  
  # モデルを保存できなくなるのでpresence: trueは記載しない
  
  def name
    item.name
  end
  
  def image
    item.image
  end
  
  def price
    item.price
  end
end
