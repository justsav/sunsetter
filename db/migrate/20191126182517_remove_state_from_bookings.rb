class RemoveStateFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :state, :string
  end
end
