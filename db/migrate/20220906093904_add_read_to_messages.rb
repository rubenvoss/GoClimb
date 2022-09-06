class AddReadToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :read, :boolean
  end
end
