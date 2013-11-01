class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  attr_accessible :bid_price, :item_id, :user_id, :quantity

  validates :item_id, :user_id,:bid_price, :quantity, presence: true

end
