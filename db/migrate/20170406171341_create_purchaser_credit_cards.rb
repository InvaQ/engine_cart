class CreatePurchaserCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_credit_cards do |t|
      t.references :order
      t.string :number
      t.string :name
      t.string :cvv 
      t.integer :expiry_month
      t.integer :expiry_year
      
      t.timestamps
    end
  end
end
