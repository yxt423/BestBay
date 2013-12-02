class MessagesController < ApplicationController

  before_filter :signed_in_user
  before_filter :is_admin?

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      format.xml  { render xml: @user }
    end
  end

  def create
    @message = Message.new(params[:message])
    @users = User.paginate(page: params[:page])
    @non_admin_users = @users.find_all_by_is_admin(false)

    respond_to do |format|
      if @message.save
        @non_admin_users.each do |user|
          UserMailer.notification_all_users(user, @message).deliver
        end

        format.html {
          redirect_to users_path, notice: 'Email sent to users!'
        }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
