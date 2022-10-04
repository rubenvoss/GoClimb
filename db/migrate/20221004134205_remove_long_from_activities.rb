class RemoveLongFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :long, :float
  end
end
