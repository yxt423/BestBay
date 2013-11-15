class AddDeactivatedToItems < ActiveRecord::Migration
  def change
    add_column :items, :deactivated, :boolean
  end
end
