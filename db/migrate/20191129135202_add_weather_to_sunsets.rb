class AddWeatherToSunsets < ActiveRecord::Migration[5.2]
  def change
    add_column :sunsets, :description, :string
    add_column :sunsets, :icon, :string
    add_column :sunsets, :tempmin, :integer
    add_column :sunsets, :tempmax, :integer
  end
end
