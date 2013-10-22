class Bid < ActiveRecord::Base
  validates :bid_price, presence: true

  belongs_to :user
  belongs_to :item

  attr_accessible :bid_price, :item_id, :user_id

end
