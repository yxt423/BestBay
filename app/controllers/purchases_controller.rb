class PurchasesController < ApplicationController
  def new
    @user = current_user
    @bids = Bid.find_all_by_user_id(current_user.id)
    @cart_items = cartItems(@bids)
    @unpaid_auctions =  unpaidAuctions(@bids)
    @purchase_items = @cart_items + @unpaid_auctions
    @purchase = Purchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
      format.xml  { render xml: @purchase }
    end
  end

  def create
    @bids = Bid.find_all_by_user_id(current_user.id)
    @cart_items = cartItems(@bids)
    @unpaid_auctions =  unpaidAuctions(@bids)
    @purchase_items = @cart_items + @unpaid_auctions
    render action: "new" unless purchases_valid(@purchase_items)

    @purchase_items.each do |bid|
      @item = Item.find(bid.item_id)

      @purchase = Purchase.new(params[:purchase])
      @purchase.user_id = @item.user_id
      @purchase.buyer_id = current_user.id
      @purchase.item_id = @item.id
      @purchase.quantity = bid.quantity
      @purchase.price = bid.bid_price
      @purchase.cost = bid.bid_price*bid.quantity

      respond_to do |format|
        if @purchase.save
          format.html {
            @item.quantity = @item.quantity - @purchase.quantity
            if @item.quantity == 0 || @item.for_auction
              @item.status = 3
            end
            @item.save
            @bid = Bid.find(bid.id)
            # if for sell, delete bid instance, if for auction, save it for bidding history
            if !@item.for_auction
              @bid.destroy
            end
          }
          format.json { render json: @purchase, status: :created, location: @purchase }
        else
          format.html { render action: "new" }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    end
    redirect_to current_user
  end

  def purchases_valid(bids)
    bids.each do |bid|
      if bid.quantity > Item.find_by_id(bid.item_id).quantity
        return false
      else
        return true
      end

    end
  end

end
