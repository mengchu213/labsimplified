FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
    patient_email { Faker::Internet.email }
  end
end