class ItemsController < ApplicationController
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  def index
    @items = current_user.items.paginate(page: params[:page])
    #@items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
      format.xml  { render xml: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = current_user.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = current_user.items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = current_user.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create

    @item = current_user.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item Added' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
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
  # DELETE /items/1.json
  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
