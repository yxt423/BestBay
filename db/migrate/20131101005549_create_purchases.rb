class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :buyer_id
      t.integer :item_id
      t.integer :quantity
      t.integer :price
      t.integer :cost
      t.string  :shipping_address
      t.timestamps
    end
  end
end
