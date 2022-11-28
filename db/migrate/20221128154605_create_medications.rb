class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :dosage
      t.time :hours
      t.boolean :taken
      t.string :purpose

      t.timestamps
    end
  end
end
