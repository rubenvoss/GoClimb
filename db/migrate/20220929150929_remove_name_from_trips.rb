class RemoveNameFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :name, :string
  end
end
