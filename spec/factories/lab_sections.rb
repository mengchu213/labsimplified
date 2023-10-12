FactoryBot.define do
  factory :lab_section do
    name { Faker::Science.element }
  end
end
