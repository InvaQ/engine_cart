class CreatePurchaserCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_coupons do |t|
      t.integer :discount
      t.string :code, index: true, unique: true
      t.references :order

      t.timestamps
    end
  end
end
