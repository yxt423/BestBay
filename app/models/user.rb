class User < ActiveRecord::Base

  has_many :items
  has_many :bids
  has_many :creditcards
  has_many :purchases

  attr_accessible :email, :fname,:lname, :password_confirmation,:password,
    :address, :phone_no,:profile_pic ,
    :is_seller,  :is_admin,
    :credit_card_no, :expiry_month,:expiry_year,:security_code,
    :shipping_address, :deactivated, :activation_token

  validates :fname,  presence: true, length: { maximum: 50 }
  validates :lname,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,
    :length => { minimum: 6 },
    :if => :password

  has_secure_password

  before_save { self.email = email.downcase }
  before_create :create_remember_token



  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def activate_new_user
    if self.deactivated?
      generate_activation_token
      UserMailer.welcome_email(self).deliver
    end
  end

  def generate_activation_token
    if self.deactivated?
      self.update_attribute(:activation_token, SecureRandom.urlsafe_base64)
    end
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
