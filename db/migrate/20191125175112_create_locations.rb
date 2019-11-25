class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :latitude, null: false
      t.references :user, foreign_key: true
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
