class Creditcard < ActiveRecord::Base
  belongs_to :user

  attr_accessible :credit_card_no, :expiry_month, :expiry_year,
                  :primary_credit_card, :security_code, :user_id


  validates :credit_card_no,:expiry_month,:expiry_year,:security_code, presence: true

  #Credit card number should be 16 digits long and should not contain alphabets, spaces or special characters
  VALID_CC_REGEX = /\d{16}/i
  validates :credit_card_no, format: {with: VALID_CC_REGEX,
                                      message: "invalid: 16 digit number needed"}

  #Credit card number should be unique
  validates :credit_card_no, :uniqueness => true

  #expiry date should be greater than or equal to the current date
  validate :valid_expiry_date

  #Security code should be 3 digits in length and it should only be a number (no spaces, letters or special characters)
  VALID_SEC_CODE_REGEX = /\d{3}/i
  validates :security_code, format: {with: VALID_SEC_CODE_REGEX,
                                     message: "invalid: 3 digit number needed"}


  def valid_expiry_date
    if expiry_year < Time.now.year || (expiry_year == Time.now.year && expiry_month < Time.now.month )
        errors.add(:expiry_month, "can't be in the past")
    end
  end

end
