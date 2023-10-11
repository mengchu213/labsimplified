FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    name { Faker::Name.name }
    role { "medtech" } # Assuming 0 is the default role for 'user'. Adjust as needed.

    trait :admin do
      role { "admin" } # Assuming 1 is the role for 'admin'. Adjust as needed.
    end
  end
end