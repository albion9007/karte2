FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password  { "abcd1234" }
    password_confirmation { password }
  end
end