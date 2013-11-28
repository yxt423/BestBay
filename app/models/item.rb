class Item < ActiveRecord::Base
  has_many :bids
  has_many :purchases
  has_one  :category

  validates :base_price,:category_id, :description, :name,:quantity, presence: true
  validates :name, length: { maximum: 256 }
  validates :description, length: { maximum: 1024 }
  has_attached_file :pic, :styles =>
                 { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user

  attr_accessible :base_price, :category_id, :description, :image_1, :image_2, :image_3,
                  :name, :user_id, :pic, :quantity, :view_count, :for_auction,
                  :bid_days, :bid_hours, :bid_minutes, :highest_bid,
                  :status, # 0: for sell, 1: started auction, 2: closed auction(not checked out yet), 3: checked out
                  :created_at, :updated_at


end
