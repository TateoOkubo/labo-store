class LineItem < ActiveRecord::Base
  validates :quantity, presence: true
  
  belongs_to :cart
  belongs_to :item
  
end
