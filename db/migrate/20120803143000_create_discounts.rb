class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.references :product, :null => false
      t.string :description
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
