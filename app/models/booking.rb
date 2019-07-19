class Booking < ApplicationRecord
  belongs_to :user,  optional: true
  belongs_to :hotel,  optional: true
  validates :user_id, presence: true
  validates :hotel_id, presence: true
  has_many :bookings_room, dependent: :destroy
end