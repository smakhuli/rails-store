class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2
      t.string :product_type
      t.string :photo
      t.string :category
      t.string :art_information
      t.string :food_information
      t.string :media_information
      t.string :other_information
      t.date :expiration_date

      t.timestamps
    end
  end
end
