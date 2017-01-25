class Item < ActiveRecord::Base
  belongs_to :type, class_name: "Type"
  
  has_many :item_relationships, class_name: "LineItem",
                                foreign_key: "item_id",
                                dependent: :destroy
  
  has_many :contain_carts, through: :item_relationships, source: :cart
  
end
