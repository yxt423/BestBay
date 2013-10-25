# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :creditcard do
    credit_card_no "MyString"
    expiry_month 1
    expiry_year 1
    security_code "MyString"
    primary_credit_card false
    user_id 1
  end
end
