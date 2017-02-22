class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :item
  
  # モデルを保存できなくなるのでpresence: trueは記載しない
end
