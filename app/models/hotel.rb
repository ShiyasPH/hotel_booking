class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
