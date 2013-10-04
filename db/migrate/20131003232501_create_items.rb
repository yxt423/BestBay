class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :category
      t.string :name
      t.string :description
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.float :base_price

      t.timestamps
    end
  end
end
