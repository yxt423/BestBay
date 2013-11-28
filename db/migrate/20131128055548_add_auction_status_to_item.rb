class AddAuctionStatusToItem < ActiveRecord::Migration
  def change
    add_column :items, :status, :integer, default: 0
    add_column :items, :highest_bid, :integer, default: 0
  end
end
