class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :patient_email

      t.timestamps
    end
  end
end
