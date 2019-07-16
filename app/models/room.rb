class Room < ApplicationRecord
  belongs_to :hotel
  validates :hotel_id, presence: true
end
