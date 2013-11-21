class UserMailer < ActionMailer::Base
  default from: "bullfrog.game@gmail.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://bbnavi.heroku.com/user?'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def notification_deactivate_item(item)
    @item = item
    @user = item.user

    mail(to: @user.email, subject: 'Your item is deactivated')
  end

  def notification_deactivate_user(user)
    @user = user

    mail(to: @user.email, subject: 'Your user account is deactivated')
  end

end