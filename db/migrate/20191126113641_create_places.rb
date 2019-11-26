class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.string :image, null: false
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end


