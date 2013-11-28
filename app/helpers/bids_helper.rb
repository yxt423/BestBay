module BidsHelper
  def isHighestBid?(bid)
    item = Item.find(bid.item_id)
    if bid.bid_price == item.highest_bid
      return true
    else
      return false
    end
  end
end
