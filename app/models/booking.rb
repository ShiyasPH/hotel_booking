class Booking < ApplicationRecord
  belongs_to :user,  optional: true
  belongs_to :hotel,  optional: true
  validates :user_id, presence: true
  validates :hotel_id, presence: true
  validate :valid_date
  has_one :bookings_room, dependent: :destroy
  has_one :room, through: :bookings_room

  private
  def valid_date
    if start_date < Date.today
      errors.add(:start_date, 'Invalid start date')
    elsif end_date < start_date
      errors.add(:end_date, 'Invalid end date')
    end
  end
end