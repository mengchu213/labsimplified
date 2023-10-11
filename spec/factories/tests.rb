FactoryBot.define do
  factory :test do
    name { Faker::Lorem.word }
    lab_section
  end
end