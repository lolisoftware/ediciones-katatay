# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    subject "MyString"
    email "MyString"
    message "MyText"
  end
end
