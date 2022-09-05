class AddCragToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :crag_id, :integer
  end
end
