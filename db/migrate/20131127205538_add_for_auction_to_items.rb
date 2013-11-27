class AddForAuctionToItems < ActiveRecord::Migration
  def change
    add_column :items, :for_auction, :boolean, default: false
  end
end
