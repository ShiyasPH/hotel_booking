class Room < ApplicationRecord
  belongs_to :hotel,  optional: true
  validates :hotel_id, presence: true
  has_many :bookings_room, dependent: :destroy
end
