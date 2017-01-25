class Cart < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  
  has_many :cart_relationships, class_name: "LineItem",
                                foreign_key: "cart_id",
                                dependent: :destroy
  
  has_many :items_in_cart, through: :cart_relationships, source: :item
  #has_many :following_relationships, class_name:  "Relationship",
  #                                   foreign_key: "follower_id",
  #                                   dependent:   :destroy
  #has_many :following_users, through: :following_relationships, source: :followed
  
end
