class CreateCreditcards < ActiveRecord::Migration
  def change
    create_table :creditcards do |t|
      t.string :credit_card_no
      t.integer :expiry_month
      t.integer :expiry_year
      t.string :security_code
      t.boolean :primary_credit_card
      t.integer :user_id

      t.timestamps
    end
  end
end
