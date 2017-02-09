class Type < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 20 },
                   uniqueness: true # nameの重複は禁止
  
  has_many :item
end
