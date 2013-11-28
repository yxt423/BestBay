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
    item.status = 2
    item.save
  end
end
