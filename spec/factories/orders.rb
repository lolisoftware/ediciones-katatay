# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user nil
    payment false
    shipping false
    observations "MyText"
    mpid "MyString"
  end
end
