class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :user_id, presence: true
  validates :hotel_id, presence: true
  has_many :bookings_room, dependent: :destroy
end
