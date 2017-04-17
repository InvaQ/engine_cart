class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.decimal :price
      t.string :image_url
      
      t.timestamps
    end
  end
end
