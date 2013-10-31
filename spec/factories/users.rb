FactoryGirl.define do
  factory :user do |u|
    u.id                    Faker::Number.digit
    u.fname                 Faker::Name.first_name 
    u.lname                 Faker::Name.last_name 
    u.email                 Faker::Internet.email
    u.password_digest       "random_string"
    u.address               Faker::Address.street_name
    u.phone_no              Faker::PhoneNumber.cell_phone
    u.credit_card_no        Faker::Business.credit_card_number
  end
end

