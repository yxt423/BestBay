module ItemsHelper
  def hotItem(item)
    if item.view_count.to_i > 3
      true
    else
      false
    end
  end

  def auctionExpire?(item)
    endtime = item.created_at
    endtime = endtime + item.bid_days.days + item.bid_hours.hours + item.bid_minutes.minutes
    currentTime = Time.now.in_time_zone

    if currentTime > endtime
      true
    else
      false
    end
  end

  def closeAuction(item)
    @item.status = 2
    #@bids = Bids.find_all_by_item_id(@item.id)
  end
end
