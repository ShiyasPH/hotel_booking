class BookingsRoom < ApplicationRecord
  belongs_to :booking,  optional: true
  belongs_to :room,  optional: true
  validates :booking_id, presence: true
  validates :room_id, presence: true
end
