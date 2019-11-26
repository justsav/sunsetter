class CreateSunsets < ActiveRecord::Migration[5.2]
  def change
    create_table :sunsets do |t|
      t.time :start, null: false
      t.time :end, null: false
      t.date :date, null: false
      t.time :gold_start, null: false
      t.time :gold_end, null: false
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
