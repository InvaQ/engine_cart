class CreatePurchaserLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_line_items do |t|
      t.integer :quantity, default: 1
      t.decimal :price, precision: 8, scale: 2
      t.references :order, index: true
      
      t.timestamps
    end
  end
end
