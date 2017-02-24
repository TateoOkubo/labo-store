class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true, 
                   length: {maximum: 50, minimum: 1,
                            too_long: "%{count}以下の文字列にしてください",
                            too_short: "%{count}以上の文字列にしてください" },
                    uniqueness: true # nameの重複は禁止

  
  # priceは必須で，整数値のみ
  validates :price, presence: true, numericality: {only_integer: true}
  
  belongs_to :type
  
  has_many :line_items,  foreign_key: "item_id",
                         dependent: :destroy
  
  has_many :contain_carts, through: :line_items, source: :cart
  
  has_many :sale_items, foreign_key: "item_id", dependent: :destroy
  has_many :purchase_items, foreign_key: "item_id", dependent: :destroy
  
  # 在庫数を表示する
  def stock
    #仕入れ数を計算
    sum_purchase = purchase_items.sum(:quantity)
    sum_sale = sale_items.sum(:quantity)
    sum_purchase - sum_sale
  end
  
  def stock?
    if stock > 0
      true
    else
      nil
    end
  end
end
