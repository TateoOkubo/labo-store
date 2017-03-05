class Cart < ActiveRecord::Base
  belongs_to :user
  
  has_many :line_items, foreign_key: "cart_id",
                        dependent: :destroy
  
  has_many :items_in_cart, through: :line_items, source: :item
  
  #商品をカートに追加
  def add(item)
    add_item = line_items.find_or_create_by(item_id: item.id)
    add_item.increment(:quantity, 1)
    add_item.save
    # 数量をインクリメント
    #item.increment(:quantity, 1)
  end
  
  # 商品をカートから取り出す
  # line_itemのquantityが0になったら削除
  def take(item)
    binding.pry
    take_item = line_items.find_by(item_id: item.id)
    
    if take_item
      take_item.increment(:quantity, -1)
      take_item.save
      
      if take_item.quantity == 0
        # 削除
        take_item.destroy
      end
    end
  end
  
  def empty?
    if line_items.count > 0
      return nil
    else
      return true
    end
  end
  
end
