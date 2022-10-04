class RemoveLatFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :lat, :float
  end
end
