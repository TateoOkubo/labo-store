class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.references :purchase, index: true#, foreign_key: true
      t.references :item, index: true#, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
