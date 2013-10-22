class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :bid_price
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
