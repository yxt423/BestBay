module ItemsHelper
  def hotItem(item)
    if item.view_count.to_i > 3
      true
    else
      false
    end
  end

  def auctionEndtime(item)
    endtime = item.created_at
    endtime = endtime + item.bid_days.days + item.bid_hours.hours + item.bid_minutes.minutes
  end

  def auctionExpire?(item)
    endtime = auctionEndtime(item)
    currentTime = Time.now.in_time_zone
    if currentTime > endtime
      true
    else
      false
    end
  end

  def closeAuction(item)
    if item.highest_bid == 0
      item.status = 3
      item.save
    end
    @bids = Bid.find_all_by_item_id(item.id)
    @bids.each do |bid|
      if bid.bid_price == item.highest_bid
        bid.winner = true
        bid.save
        item.status = 2
        item.save
        break
      end
    end
  end

  # find items to show in "cart"
  def cartItems(bids)
    cartItems = []
    bids.each do |bid|
      item = Item.find(bid[:item_id])
      if !item.for_auction
         cartItems << bid
      end
    end
    cartItems
  end

  # find items to show in "unpaid auctions"
  def unpaidAuctions(bids)
    unpaidAuctions = []
    bids.each do |bid|
      item = Item.find(bid[:item_id])
      if bid.winner && item.for_auction && item.status == 2
         unpaidAuctions << bid
      end
    end
    unpaidAuctions
  end


end
