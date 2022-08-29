class CreateCrags < ActiveRecord::Migration[7.0]
  def change
    create_table :crags do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.references :country, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
