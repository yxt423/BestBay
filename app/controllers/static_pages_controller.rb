class StaticPagesController < ApplicationController



  def home
    #if signed_in?
      #@items = current_user.items.paginate(page: params[:page])
      #render @items
      redirect_to items_path
    #end
  end

  def help
  end

  def about
  end

  def contact
  end
end
