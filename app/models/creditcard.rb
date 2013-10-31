class Creditcard < ActiveRecord::Base




  #validates :credit_card_no, presence: true
  #validates :expiry_month, presence: true
  #validates :expiry_year, presence: true
  #validates :security_code, presence: true

  #Credit card number should be 16 digits long and should not contain alphabets, spaces or special characters
  #VALID_CC_REGEX = /\d(16)/i
  #validates :credit_card_no, format: {with: VALID_CC_REGEX}

  #Credit card number should be unique
  #validates :credit_card_no, :uniqueness => true

  #expiry year should be greater than or equal to the current year
  #validates :expiry_year >= Time.now.year

  #expiry month should be greater than the current month
 # validates :expiry_month >= Time.now.month

  #Security code should be 3 digits in length and it should only be a number (no spaces, letters or special characters)
  #VALID_SEC_CODE_REGEX = /\d(3)/i
  #validates :security_code, format: {with: VALID_SEC_CODE_REGEX}

  belongs_to :user

  attr_accessible :credit_card_no, :expiry_month, :expiry_year, :primary_credit_card, :security_code, :user_id

end
