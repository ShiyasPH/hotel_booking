class Room < ApplicationRecord
  belongs_to :hotel
  validates :hotel_id, presence: true
  has_many :bookings, dependent: :destroy
end
