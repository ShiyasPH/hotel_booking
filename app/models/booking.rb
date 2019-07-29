class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :room
  validates :user_id, presence: true
  validates :room_id, presence: true
  validate :valid_date

  private
  def valid_date
    if start_date < Date.today
      errors.add(:start_date, 'Invalid start date')
    elsif end_date < start_date
      errors.add(:end_date, 'Invalid dates')
    end
  end
  
end
