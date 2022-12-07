class CreateTakenMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :taken_medications do |t|
      t.references :medication, null: false, foreign_key: true
      t.datetime :taken_date

      t.timestamps
    end
  end
end
