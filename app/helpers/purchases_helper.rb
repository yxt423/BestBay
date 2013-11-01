module PurchasesHelper
  def total_price(bids)
    total_price = 0
    bids.each do |bid|
      total_price += bid.bid_price*bid.quantity
    end
    total_price
  end
end
