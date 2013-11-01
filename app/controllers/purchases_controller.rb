class PurchasesController < ApplicationController
  def new
    @bids = Bid.find_all_by_user_id(current_user.id)
    @user = current_user
    @purchase = Purchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
      format.xml  { render xml: @purchase }
    end
  end

  def create
    @bids = Bid.find_all_by_user_id(current_user.id)
    @bids.each do |bid|
      @item = Item.find(bid.item_id)

      @purchase = Purchase.new(params[:purchase])
      @purchase.user_id = @item.user_id
      @purchase.buyer_id = current_user.id
      @purchase.item_id = @item.id

      respond_to do |format|
        if @purchase.save

          format.html { }
          format.json { render json: @purchase, status: :created, location: @purchase }
        else
          format.html { render action: "new" }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    end
    redirect_to current_user
  end

end
