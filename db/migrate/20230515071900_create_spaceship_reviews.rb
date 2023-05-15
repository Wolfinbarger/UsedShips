class CreateSpaceshipReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceship_reviews do |t|
      t.string :comment
      t.references :spaceship, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
