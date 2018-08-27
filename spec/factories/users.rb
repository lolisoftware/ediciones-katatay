FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'user@test.com'
    password 'passwordtest'
    password_confirmation 'passwordtest'
    confirmed_at Time.now
  end
end