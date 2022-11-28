class CreateDoggies < ActiveRecord::Migration[7.0]
  def change
    create_table :doggies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.string :petname

      t.timestamps
    end
  end
end
