class ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page])
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
    @items = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
      format.xml  { render xml: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:items])

    respond_to do |format|
      if @item.save
        sign_in @item
        format.html { redirect_to @item, notice: 'Welcome to iShopping!' }
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
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(params[:items])
        format.html {
          flash[:success] = "Item Added"
          sign_in @item
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
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private

  def correct_item
    @item = Item.find(params[:id])
    redirect_to(root_path) unless current_item?(@item)
  end
end
