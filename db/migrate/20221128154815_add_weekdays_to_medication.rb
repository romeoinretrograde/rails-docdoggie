class AddWeekdaysToMedication < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :weekdays, :text, array: true, default: []
  end
end
