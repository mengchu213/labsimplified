FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    name { Faker::Name.name }
    role { "medtech" } 

    trait :admin do
      role { "admin" } 
    end
  end
end