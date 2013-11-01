class AddColumnToBids < ActiveRecord::Migration
  def change
    add_column :bids, :quantity, :integer
  end
end
