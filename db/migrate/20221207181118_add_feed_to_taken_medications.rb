class AddFeedToTakenMedications < ActiveRecord::Migration[7.0]
  def change
    add_column :taken_medications, :feed, :boolean, default: false
  end
end
