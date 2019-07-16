class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :user_id, presence: true
  validates :hotel_id, presence: true
end
