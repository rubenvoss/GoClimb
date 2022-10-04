class AddCoordinatesToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :lat, :float
    add_column :activities, :long, :float
  end
end
