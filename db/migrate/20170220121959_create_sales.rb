class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user
      #t.references :sale_items

      t.timestamps null: false
    end
  end
end
