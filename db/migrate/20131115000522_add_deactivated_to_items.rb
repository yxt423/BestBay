class AddDeactivatedToItems < ActiveRecord::Migration
  def change
    add_column :items, :deactivated, :boolean, default: false
  end
end
