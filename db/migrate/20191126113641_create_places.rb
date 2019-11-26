class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :image
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
