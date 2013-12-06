module ItemsHelper
  def hotItem(item)

    if item.view_count.to_i > 3
      true
    else
      false
    end

  end

  def itemsToShow(items)
    itemsToShow = []
    if is_admin?
      itemsToShow = items
    else
      items.each do |item|
        if !item.deactivated
          if item.for_auction && item.status == 1  # do not show closed auctions
            itemsToShow << item
          elsif !item.for_auction && item.status == 0   # do not show stockout items (for sell)
            itemsToShow << item
          end
        end
      end
    end
    itemsToShow
  end

  def findWinner(item)
    @bids = Bid.find_all_by_item_id(item.id)
    @bids.each do |bid|
      if bid.winner
        return User.find(bid.user_id)
        break
      end
    end
    return nil
  end

  # Note: used for both "My cart" and "bidding history"
  def itemStatusStr(item)
    item_status_str = ""
    case item.status
    when 0
      item_status_str = "for sale"
    when 1
      item_status_str = "ongoing auction"
    when 2
      item_status_str = "auction closed (waiting for payment)"
    when 3
      item_status_str = "auction closed"
    end
    item_status_str
  end

  def bidStatusStr(bid)
    bid_status_str = ""
    item = Item.find(bid.item_id)
    if item.for_auction
      if item.status == 1 # for ongoning auctions
        if isHighestBid?(bid)
          bid_status_str = "Highest bid!"
        else
          bid_status_str = "not highest bid"
        end
      else # for closed auctions
        if isHighestBid?(bid)
          bid_status_str = "Winner!"
        else
          bid_status_str = "not highest bid"
        end
      end
    end
    bid_status_str
  end

  ##### Functions for auction status #####

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

  def checkItemStatus(items)
    if items.class == Array
      items.each do |item|
        if item.for_auction && item.status == 1 && auctionExpire?(item)
          closeAuction(item)
        end
      end
    elsif items.class == Item
      item = items
      if item.for_auction && item.status == 1 && auctionExpire?(item)
        closeAuction(item)
      end
    end
  end

  def closeAuction(item)
    if item.highest_bid == 0  # no bider
      item.status = 3
      item.save
      return
    end
    # mark the winner
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

  ##### Functions for My cart page #####

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
