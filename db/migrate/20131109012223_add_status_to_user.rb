class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :deactivated, :boolean, default: true
  end
end
