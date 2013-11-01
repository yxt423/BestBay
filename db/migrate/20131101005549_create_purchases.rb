class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :buyer_id
      t.integer :item_id
      t.integer :quantity
      t.string :shipping_address
      t.timestamps
    end
  end
end
