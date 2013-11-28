class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :check_credit_card_info, only: [:new, :create, :destroy]

  def index
    @cats = Category.all
    @catid = params[:cat]
    if @catid == NIL
      @categ = "All Items"
      @items = Item.all
    else
      @categ = Category.find(@catid)
      @items = Item.find_all_by_category_id(@catid)
    end

    @items.each do |item|
      if item.for_auction && auctionExpire?(item)
        closeAuction(item)
      end
    end

    if is_admin? ==  false || current_user.nil?
      @items.each do |item|
        if item.deactivated == true # do not show deactivated items
          @items.delete(item)
        elsif item.for_auction && item.status != 1  # do not show closed auctions
          @items.delete(item)
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
      format.xml  { render xml: @items }
    end
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])

    #update the viewed times counter of item
    @item.view_count = @item.view_count.to_i.next
    @item.save

    @bids = Bid.find_all_by_item_id(@item.id)
    @highest_bid = @bids[-1]

    #TO BUY AN ITEM :-
    if signed_in?
    @bid = current_user.bids.new
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/new
  def new
    @item = current_user.items.build
    @cats = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = current_user.items.find(params[:id])
    @cats = Category.all
  end

  # POST /items
  def create
    @item = current_user.items.build(params[:item])
    @item.view_count = -1
    @item.highest_bid = 0

    respond_to do |format|
      if @item.save

        #mark the current user as seller
        @user = current_user
        @user.is_seller = true
        @user.save

        format.html { redirect_to @item, notice: 'Item Added' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  def update
    @item = current_user.items.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(params[:items])
        format.html {
          flash[:success] = "Item Added"
          redirect_to @item  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end


  def deactivate_item
    @item = Item.find(params[:id])
    if @item != nil
      @item.deactivated = true
      @item.save
      UserMailer.notification_deactivate_item(@item).deliver
    end
    respond_to do |format|
      format.js
      format.html
      format.json { head :no_content }
    end
  end

  def activate_item
    @item = Item.find(params[:id])
    if @item != nil
      @item.deactivated = false
      @item.save
      UserMailer.notification_activate_item(@item).deliver
    end
    respond_to do |format|
      format.js
      format.html
      format.json { head :no_content }
    end
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
