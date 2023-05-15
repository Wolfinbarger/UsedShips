class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.integer :speed
      t.string :armaments
      t.string :size
      t.integer :max_weight
      t.integer :crew
      t.string :features
      t.string :location
      t.string :description
      t.string :language
      t.string :ship_model
      t.integer :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
