class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.references :crag, null: false, foreign_key: true
      t.text :bio
      t.references :user, null: false, foreign_key: true
      t.integer :age

      t.timestamps
    end
  end
end
