class CreditcardsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]

  def new
    @creditcard = current_user.creditcards.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @creditcard }
      format.xml  { render xml: @creditcard }
    end

  end

  def index
    @creditcards = current_user.creditcards.all
  end

  def edit
    @creditcard = current_user.creditcards.first
  end

  def create

    @creditcard = current_user.creditcards.build(params[:creditcard])
    @creditcard.security_code = Creditcard.encrypt(@creditcard.security_code)
    respond_to do |format|
      if @creditcard.save
        format.html {
          if   stored_location  == '/signup'
            redirect_to root_path
          else
            redirect_back_or root_path
          end
          #notice: 'Credit card information added'
        }
        format.json { render json: @creditcard, status: :created, location: @creditcard }
      else
        format.html { render action: "new" }
        format.json { render json: @creditcard.errors, status: :unprocessable_entity }
      end
    end    

  end
  
  def update
    @creditcard = current_user.creditcards.find(params[:id])
    respond_to do |format|
      if @creditcard.update_attributes(params[:creditcards])
        format.html {
          flash[:success] = "Credit card information updated"
          redirect_to @current_user  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @creditcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creditcards/1
  def destroy
    @creditcard = current_user.creditcards.find(params[:id])
    @creditcard.destroy

    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end
end
