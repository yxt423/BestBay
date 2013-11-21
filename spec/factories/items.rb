# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :items do
    user_id 1
    category_id 1
    name "MyString"
    description "MyString"
    image_1 "MyString"
    image_2 "MyString"
    image_3 "MyString"
    base_price 1.5
  end
end
