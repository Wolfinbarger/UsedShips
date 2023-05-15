class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :rate, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :crew, numericality: { only_integer: true }
  validates :max_weight, numericality: { only_integer: true }
end
