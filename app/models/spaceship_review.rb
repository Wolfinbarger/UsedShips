class SpaceshipReview < ApplicationRecord
  belongs_to :spaceship_id
  belongs_to :user_id
  validates :comment, presence: true
end
