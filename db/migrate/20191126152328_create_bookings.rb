class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :state
      t.string :description
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.date :date, null: false
      t.boolean :public, null: false

      t.timestamps
    end
  end
end
