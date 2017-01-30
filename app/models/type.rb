class Type < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 20 }
  
  has_many :item
end
