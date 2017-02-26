class Sale < ActiveRecord::Base
  validates :user_id, presence: true 
  
  has_many :sale_items ,foreign_key: "sale_id",
                         dependent: :destroy
  accepts_nested_attributes_for :sale_items
  belongs_to :user
  
  #販売
  def record (line_items)
    p line_items
    line_items.each do |item|

      sale_items.find_or_create_by(item_id: item.item_id, quantity: item.quantity)
      #item削除
      item.destroy
    end
  end
  
  #合計金額を計算
  def totalFee
    total = 0
    sale_items.each do |s|
      total += s.fee
    end
    return total
  end
  
  #在庫があるかチェックする
  def stockCheck
    binding.pry
    sale_items.each do |i|
      
    end
  end
  
  
end
