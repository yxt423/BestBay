class AddCreditCardInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expiry_month, :integer
    add_column :users, :expiry_year, :integer
    add_column :users, :security_code, :integer
  end
end
