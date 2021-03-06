class BidsController < ApplicationController
  before_filter :check_credit_card_info, only: [:new, :create, :buy]

  def create
    respond_to do |format|
      @bid = current_user.bids.build(params[:bid])
      if validBid?(@bid)
        @item = Item.find(params[:bid][:item_id])
        @item.highest_bid = @bid.bid_price
        @item.save
        @bid.quantity = 1
        @bid.winner = false
        if @bid.save
          format.html { redirect_to current_user, notice: 'Bid Added' }
          format.json { render json: @bid, status: :created, location: @bid }
        else
          format.html { render action: "new" }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to item_path(params[:bid][:item_id]), notice: "Bidding price should be greater than the highest bid" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /bids/new
  def new
    @item = Item.find(params[:item_id])
    @bids = Bid.find_all_by_item_id(params[:item_id])
    @highest_bid = @bids[-1]
    @bid = current_user.bids.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end

  end

  def buy
    @item = Item.find(params[:item_id])
    @bid = Bid.new(params[:bid])
    @bids = Bid.find_all_by_item_id(params[:item_id])
    @total = @bid.quantity

    i = 0
    while i < @bids.size do
      if @bids[i].user_id == current_user.id
        break
      end
      i += 1
    end

    if @bids.size != 0  && i < @bids.size
      @total += @bids[i].quantity
      if @total <= @item.quantity
        @bids[i].update_attribute(:quantity,(@total))
        respond_to do |format|
          format.html { redirect_to "/users/#{current_user.id}/cart", notice: 'Cart Updated!' }
          format.json { render json: @bid, status: :created, location: @bid }
        end
      else
        respond_to do |format|
          format.html { redirect_to item_path, notice: 'Cart size cant be more than inventory!!!' }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    else
      @bid.bid_price = @item.base_price
      @bid.item_id = @item.id
      @bid.user_id = current_user.id
      if @total <= @item.quantity
        respond_to do |format|
          if @bid.save
            format.html { redirect_to "/users/#{current_user.id}/cart", notice: 'Item added to cart!' }
            format.json { render json: @bid, status: :created, location: @bid }
          else
            format.html { redirect_to item_path, notice: 'Failed to process' }
            format.json { render json: @bid.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to item_path, notice: 'Cart size cant be more than inventory!!!' }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def validBid?(bid)
    @item = Item.find(bid[:item_id])
    if @item.highest_bid == 0
      if bid.bid_price > @item.base_price
        return true
      else
        return false
      end
    else
      if bid.bid_price > @item.highest_bid
        return true
      else
        return false
      end
    end
  end

end
