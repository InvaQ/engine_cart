class CreatePurchaserOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_orders do |t|
      t.string :state
      t.integer :user_id, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2
      t.references :purchaser_delivery, foreign_key: true
      
      t.timestamps
    end
  end
end
