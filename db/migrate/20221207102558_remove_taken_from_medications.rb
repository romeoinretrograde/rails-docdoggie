class RemoveTakenFromMedications < ActiveRecord::Migration[7.0]
  def change
    remove_column :medications, :taken, :boolean
  end
end
