class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :cart, index: true
      t.references :item, index: true
      t.integer :quantity, default: 0

      t.timestamps null: false
      
      t.index [:cart_id, :item_id], unique: true
    end
  end
end
