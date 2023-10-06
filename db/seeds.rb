# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!( 
  name: "joe",
  email: 'admin@gmail.com',
  password: '123456', 
  password_confirmation: '123456',
  role: 1
)

# # # Lab Sections
# # 10.times do |i|
# #   LabSection.find_or_create_by!(
# #     name: "Lab Section #{i + 1}"
# #   )
# # end

# # # Patients
# # 10.times do |i|
# #   Patient.find_or_create_by!(
# #     name: "Patient #{i + 1}",
# #     dob: Date.new(1990, 1, 1) + i.years,
# #     patient_email: "patient#{i + 1}@example.com"
# #   )
# # end
# # # Lab Sections
# # 10.times do |i|
# #   LabSection.find_or_create_by!(
# #     name: "Lab Section #{i + 1}"
# #   )
# # end

# # # Patients
# # 10.times do |i|
# #   Patient.find_or_create_by!(
# #     name: "Patient #{i + 1}",
# #     dob: Date.new(1990, 1, 1) + i.years,
# #     patient_email: "patient#{i + 1}@example.com"
# #   )
# # end

# # # Users
# # 10.times do |i|
# #   User.find_or_create_by!(
# #     email: "user#{i + 1}@example.com"
# #   ) do |user|
# #     user.password = 'password'
# #     user.password_confirmation = 'password'
# #     user.name = "User #{i + 1}"
# #     user.role = i.zero? ? 1 : 0
# #   end
# # end

# # # Tests, Samples, and Test Results
# # LabSection.all.each_with_index do |lab_section, i|
# #   test = Test.find_or_create_by!(
# #     name: "Test #{i + 1}",
# #     lab_section: lab_section
# #   )

# #   patient = Patient.find(i + 1)
# #   sample = Sample.find_or_create_by!(
# #     sample_type: "Type #{i + 1}",
# #     test: test,
# #     patient: patient
# #   ) do |sample|
# #     sample.status = %w[pending processing completed].sample
# #   end

# #   TestResult.find_or_create_by!(
# #     result: "Result #{i + 1}",
# #     sample: sample
# #   )
# # end


# # Tests, Samples, and Test Results
# LabSection.all.each_with_index do |lab_section, i|
#   test = Test.find_or_create_by!(
#     name: "Test #{i + 1}",
#     lab_section: lab_section
#   )

#   patient = Patient.find(i + 1)
#   sample = Sample.find_or_create_by!(
#     sample_type: "Type #{i + 1}",
#     test: test,
#     patient: patient
#   ) do |sample|
#     sample.status = %w[pending processing completed].sample
#   end

#   TestResult.find_or_create_by!(
#     result: "Result #{i + 1}",
#     sample: sample
#   )
# end

laboratory_sections = {
  'CLINICAL CHEMISTRY' => [
    'FBS', 'RBS', 'OGCT', 'OGTT', '2HPPBS', 'ALP', 'AST/SGOT', 'ALT/SGPT', 'LDH', 'TPAG',
    'BLOOD URIC ACID', 'BUN', 'CREATININE', 'LIPID PROFILE', 'CHOLESTEROL', 'TRIGLYCERIDES', 'HDL', 'LDL/VLDL'
  ],
  'HEMATOLOGY' => [
    'COMPLETE BLOOD COUNT', 'PLATELET COUNT', 'RETICULOCYTE COUNT', 'ESR', 'PERIPHERAL BLOOD SMEAR',
    'CLOTTING AND BLEEDING TIME', 'PT', 'PTT'
  ],
  'MICROBIOLOGY' => [
    'AFB STAIN', 'GRAM STAIN', 'KOH', 'BLOOD C/S'
  ],
  'CLINICAL MICROSCOPY' => [
    'URINALYSIS', 'PREGNANCY TEST', 'FECALYSIS', 'OCCULT BLOOD'
  ],
  'SEROLOGY/IMMUNOLOGY' => [
    'ABO/Rh TYPING', 'CROSS MATCHING', 'DIRECT COOMB’S TEST', 'HBsAG (QUALI/QUANTI)', 'ANTI HBS',
    'ANTI-HAV (IgG, IgM)', 'PRP (QUALI/QUANTI)'
  ]
}

# # Create Laboratory Sections and Tests
# laboratory_sections.each do |section_name, tests|
#   lab_section = LabSection.find_or_create_by!(name: section_name)
  
#   tests.each do |test_name|
#     Test.find_or_create_by!(name: test_name, lab_section: lab_section)
#   end
# end


# Creating Patients
# patient1 = Patient.create!(name: "John Doe", dob: "1980-01-01", patient_email: "john.doe@example.com")
# patient2 = Patient.create!(name: "Jane Doe", dob: "1990-02-02", patient_email: "jane.doe@example.com")
# patient3 = Patient.create!(name: "Jim Beam", dob: "1985-03-03", patient_email: "jim.beam@example.com")
# patient4 = Patient.create!(name: "Jack Daniels", dob: "1975-04-04", patient_email: "jack.daniels@example.com")
# patient5 = Patient.create!(name: "Johnny Walker", dob: "2000-05-05", patient_email: "johnny.walker@example.com")

# Creating Samples (Assuming you have some Test instances created, replace Test.first.id with actual test_id you want to associate)
sample1 = Sample.create!(sample_type: "Blood", status: "pending", test_id: Test.first.id, patient_id: patient1.id)
sample2 = Sample.create!(sample_type: "Urine", status: "processing", test_id: Test.first.id, patient_id: patient2.id)
sample3 = Sample.create!(sample_type: "Saliva", status: "completed", test_id: Test.first.id, patient_id: patient3.id)
sample4 = Sample.create!(sample_type: "Blood", status: "pending", test_id: Test.first.id, patient_id: patient4.id)
sample5 = Sample.create!(sample_type: "Urine", status: "completed", test_id: Test.first.id, patient_id: patient5.id)

# Creating Test Results
TestResult.create!(result: "Positive", sample_id: sample1.id)
TestResult.create!(result: "Negative", sample_id: sample2.id)
TestResult.create!(result: "Positive", sample_id: sample3.id)
TestResult.create!(result: "Negative", sample_id: sample4.id)
TestResult.create!(result: "Positive", sample_id: sample5.id)
