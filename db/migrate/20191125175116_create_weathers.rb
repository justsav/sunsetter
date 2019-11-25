class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :sunset_time, null: false
      t.string :date, null: false
      t.references :location, foreign_key: true
      t.string :temperature, null: false
      t.string :visibility, null: false
      t.string :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
