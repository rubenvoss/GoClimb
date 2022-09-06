class AddReadToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :read, :string
    add_column :messages, :boolean, :string
  end
end
