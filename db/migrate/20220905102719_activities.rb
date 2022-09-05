class Activities < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :crag_id, :integer
  end
end
