class Item < ActiveRecord::Base
  validates :name, presence: true, 
                   length: {maximum: 50, minimum: 1,
                            too_long: "%{count}以下の文字列にしてください",
                            too_short: "%{count}以上の文字列にしてください" }
  
  # priceは必須で，整数値のみ
  validates :price, presence: true, numericality: {only_integer: true}
  
  belongs_to :type
  
  has_many :line_items,  foreign_key: "item_id",
                         dependent: :destroy
  
  has_many :contain_carts, through: :line_items, source: :cart
  
end