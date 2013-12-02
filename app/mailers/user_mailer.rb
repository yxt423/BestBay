class UserMailer < ActionMailer::Base
  default from: "bullfrog.game@gmail.com"
  def welcome_email(user)
    @user = user
    @url  = ["http://localhost:3000/users/activate_new_user?activation_token=",@user.activation_token].join("")
    @actual_url = ["http://bbnavi.herokuapp.com/users/activate_new_user?activation_token=",@user.activation_token].join("")
    mail(to: @user.email, subject: 'Welcome to Best Bay')
  end

  def notification_deactivate_item(item)
    @item = item
    @user = item.user
    @url  = 'http://bbnavi.heroku.com/user?'
    mail(to: @user.email, subject: 'Your item is deactivated')
  end

  def notification_activate_item(item)
    @item = item
    @user = item.user
    @url  = 'http://bbnavi.heroku.com/user?'
    mail(to: @user.email, subject: 'Your item has been activated again')
  end

  def notification_deactivate_user(user)
    @user = user
    @url  = 'http://bbnavi.heroku.com/user?'
    mail(to: @user.email, subject: 'Your BestBay account has been deactivated')
  end

  def notification_activate_user(user)
    @user = user
    @url  = 'http://bbnavi.heroku.com/user?'
    mail(to: @user.email, subject: 'Your BestBay account has been activated now')
  end

  def notification_delete_user(user)
    @user = user

    mail(to: @user.email, subject: 'Your BestBay account has been deleted')
  end

  def notification_all_users(user, message)
    @message = message
    @user = user
    mail(to: user.email, subject: @message.subject)

  end

end
