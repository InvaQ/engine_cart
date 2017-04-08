class CreatePurchaserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :purchaser_addresses do |t|
      t.references :addressable, polymorphic: true, index: { name: 'index_purchaser_adrs_on_adrsable_type_and_adrsable_id' }
      t.string :addressable_type
      t.integer :addressable_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.references :country
      t.string :city
      t.string :zip
      t.string :phone
      t.string :type

      t.timestamps
    end
  end
end