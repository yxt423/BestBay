class Purchase < ActiveRecord::Base

  belongs_to :user
  belongs_to :item

  attr_accessible :user_id, :buyer_id, :item_id, :quantity, :shipping_address

end
