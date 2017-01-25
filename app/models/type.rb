class Type < ActiveRecord::Base
  has_many :item, class_name: "Item"
end
