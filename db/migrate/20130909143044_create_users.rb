class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone_no
      t.string :credit_card_no
      t.boolean :is_seller
      t.string :profile_pic

      t.timestamps
    end

  end
end
