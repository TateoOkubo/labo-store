class LineItem < ActiveRecord::Base
  belongs_to :cart, class_name: "Cart"
  belongs_to :item, class_name: "Item"
  
end
