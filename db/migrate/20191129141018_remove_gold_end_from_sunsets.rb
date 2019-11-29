class RemoveGoldEndFromSunsets < ActiveRecord::Migration[5.2]
  def change
    remove_column :sunsets, :gold_end
  end
end
