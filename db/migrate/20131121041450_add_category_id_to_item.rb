class AddCategoryIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :category_id, :integer
    remove_column :items, :category
  end
end
