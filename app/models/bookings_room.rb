class BookingsRoom < ApplicationRecord
  belongs_to :booking
  belongs_to :room
  validates :booking_id, presence: true
  validates :room_id, presence: true
end
