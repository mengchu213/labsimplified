FactoryBot.define do
  factory :test_result do
    result { Faker::Lorem.sentence }
    sample
  end
end