 class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update,:destroy, :enter_credit_card, :update_credit_card]
  before_filter :correct_user,   only: [:edit, :update, :enter_credit_card, :update_credit_card]
  before_filter :is_admin?,     only: :destroy
  # GET /users
  def index
    @users = User.paginate(page: params[:page])
    @non_admin_users = @users.find_all_by_is_admin(false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.xml  { render xml: @users }
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    if is_admin?
      @items = @user.items
      @bids = Bid.find_all_by_user_id(@user.id)
      @purchases = Purchase.find_all_by_buyer_id(params[:id])
    else
      redirect_to(current_user) unless current_user?(@user)
      # creating an items array to get users all items
      @items = current_user.items
      @bids = Bid.find_all_by_user_id(current_user.id)
      @purchases = Purchase.find_all_by_buyer_id(params[:id])
    end


  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      format.xml  { render xml: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # GET /users/1/enter_credit_card
  def enter_credit_card
    @user = User.find(params[:id])
  end

  def validate_email
    @uid = params[:token]
    if @token != nil
      @user = User.find(@uid)

    end

  end

  # POST /users
  def create
    @user = User.new(params[:user])
    @user.is_admin = false
    respond_to do |format|
      if @user.save
        sign_in @user
        UserMailer.welcome_email(@user).deliver
        format.html {

          if @user.is_seller
            store_location
            redirect_to new_creditcard_path, notice: 'Please enter your credit card information'
          else
            redirect_to @user, notice: 'Welcome to BestBay!'
          end

        }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {
          flash[:success] = "Profile updated"
          sign_in @user
          redirect_to @user  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

    # GET /users/1/cart
  def cart
    @user = User.find(params[:id])
    @bids = Bid.find_all_by_user_id(current_user.id)
    if @bids.size == 0
      respond_to do |format|
        format.html { redirect_to items_path, notice: 'Cart Empty' }
      end
    end

  end

  def deactivate_user
    @user = User.find(params[:id])
    if @user != nil
      @user.deactivated = true
      @user.save
      UserMailer.notification_deactivate_user(@user).deliver
    end
    respond_to do |format|
      format.js
      format.html
      format.json { head :no_content }
    end
  end

  def activate_user
    @user = User.find(params[:id])
    if @user != nil
      @user.deactivated = false
      @user.save
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
