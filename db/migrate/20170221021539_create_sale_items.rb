class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :sale
      t.references :item
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
