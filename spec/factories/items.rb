# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :items do
    category nil
    title "MyString"
    subtitle "MyString"
    year "MyString"
    format "MyString"
    pages 1
    author "MyString"
    isbn "MyString"
    price 1.5
    description "MyText"
    index "MyString"
    image "MyString"
  end
end
