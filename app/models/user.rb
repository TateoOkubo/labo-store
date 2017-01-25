class User < ActiveRecord::Base
  has_one :cart, class_name: "Cart"
  
  
end
