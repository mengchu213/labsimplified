class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.references :lab_section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
