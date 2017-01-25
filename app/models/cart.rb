class Cart < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  
  has_many :cart_relationships, class_name: "LineItem",
                                foreign_key: "cart_id",
                                dependent: :destroy
  
  has_many :items_in_cart, through: :cart_relationships, source: :item
  
  #商品をカートに追加
  def add(item)
    add_item = cart_relationships.find_or_create_by(item_id: item.id)
    add_item.increment(:quantity, 1)
    add_item.save
    # 数量をインクリメント
    #item.increment(:quantity, 1)
  end
  
  # 商品をカートから取り出す
  # line_itemのquantityが0になったら削除
  def take(item)
    binding.pry
    take_item = cart_relationships.find_by(item_id: item.id)
    
    if take_item
      take_item.increment(:quantity, -1)
      take_item.save
      
      if take_item.quantity == 0
        # 削除
        take_item.destroy
      end
    end
  end
  
end
