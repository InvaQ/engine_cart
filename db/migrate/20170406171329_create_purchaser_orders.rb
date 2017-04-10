class CreatePurchaserOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_orders do |t|
      t.references :person, polymorphic: true
      t.string :state
      t.decimal :total_price, precision: 10, scale: 2
      t.references :delivery
      
      t.timestamps
    end
  end
end
