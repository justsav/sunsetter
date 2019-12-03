class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.string :image
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
