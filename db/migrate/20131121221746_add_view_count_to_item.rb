class AddViewCountToItem < ActiveRecord::Migration
  def change
    add_column :items, :view_count, :integer
  end
end
