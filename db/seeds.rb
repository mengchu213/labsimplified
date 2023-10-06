# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!( 
  name: "joe",
  email: 'admins@gmail.com',
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

# laboratory_sections = {
#   'CLINICAL CHEMISTRY' => [
#     'FBS', 'RBS', 'OGCT', 'OGTT', '2HPPBS', 'ALP', 'AST/SGOT', 'ALT/SGPT', 'LDH', 'TPAG',
#     'BLOOD URIC ACID', 'BUN', 'CREATININE', 'LIPID PROFILE', 'CHOLESTEROL', 'TRIGLYCERIDES', 'HDL', 'LDL/VLDL'
#   ],
#   'HEMATOLOGY' => [
#     'COMPLETE BLOOD COUNT', 'PLATELET COUNT', 'RETICULOCYTE COUNT', 'ESR', 'PERIPHERAL BLOOD SMEAR',
#     'CLOTTING AND BLEEDING TIME', 'PT', 'PTT'
#   ],
#   'MICROBIOLOGY' => [
#     'AFB STAIN', 'GRAM STAIN', 'KOH', 'BLOOD C/S'
#   ],
#   'CLINICAL MICROSCOPY' => [
#     'URINALYSIS', 'PREGNANCY TEST', 'FECALYSIS', 'OCCULT BLOOD'
#   ],
#   'SEROLOGY/IMMUNOLOGY' => [
#     'ABO/Rh TYPING', 'CROSS MATCHING', 'DIRECT COOMB’S TEST', 'HBsAG (QUALI/QUANTI)', 'ANTI HBS',
#     'ANTI-HAV (IgG, IgM)', 'PRP (QUALI/QUANTI)'
#   ]
# }

# # Create Laboratory Sections and Tests
# laboratory_sections.each do |section_name, tests|
#   lab_section = LabSection.find_or_create_by!(name: section_name)
  
#   tests.each do |test_name|
#     Test.find_or_create_by!(name: test_name, lab_section: lab_section)
#   end
# end


# Creating Patients
