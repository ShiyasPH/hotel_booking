class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
end
