class AddWinnerToBids < ActiveRecord::Migration
  def change
    add_column :bids, :winner, :boolean, default: false
  end
end
