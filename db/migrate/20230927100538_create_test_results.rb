class CreateTestResults < ActiveRecord::Migration[7.0]
  def change
    create_table :test_results do |t|
      t.text :result
      t.references :sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
