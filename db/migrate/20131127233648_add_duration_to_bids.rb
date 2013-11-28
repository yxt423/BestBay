class AddDurationToBids < ActiveRecord::Migration
  def change
    add_column :items, :bid_days, :integer, default: 0
    add_column :items, :bid_hours, :integer, default: 0
    add_column :items, :bid_minutes, :integer, default: 0
  end
end
