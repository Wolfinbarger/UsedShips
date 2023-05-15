class Booking < ApplicationRecord
  belongs_to :spaceship_id
  belongs_to :user_id
  validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
  validates :total_price, presence: true, numericality: { only_integer: true }
end
