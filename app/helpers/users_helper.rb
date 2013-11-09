module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end


  def type(user)
    if user.is_admin?
      usertype = "Administrator"
    elsif user.is_seller?
      usertype = "Seller"
    else
      usertype = "Buyer"
    end
  end


end