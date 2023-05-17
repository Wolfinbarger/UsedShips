class SpaceshipReview < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user
  validates :comment, presence: true
end
