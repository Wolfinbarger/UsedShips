class Booking < ApplicationRecord
  belongs_to :spaceship_id
  belongs_to :user_id
end
