class AddUrlToCrags < ActiveRecord::Migration[7.0]
  def change
    add_column :crags, :url, :string
  end
end
