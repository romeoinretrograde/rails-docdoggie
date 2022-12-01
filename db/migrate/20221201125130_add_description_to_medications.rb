class AddDescriptionToMedications < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :description, :text, default: "Empty description."
  end
end
