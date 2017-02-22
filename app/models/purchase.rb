class Purchase < ActiveRecord::Base
  has_many :purchase_items, foreign_key: "purchase_id", dependent: :destroy
end
