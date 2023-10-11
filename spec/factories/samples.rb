FactoryBot.define do
  factory :sample do
    sample_type { Faker::Lorem.word }
    status { ['pending', 'processing', 'completed'].sample }
    test
    patient
  end
end