class Sale < ActiveRecord::Base
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
end
