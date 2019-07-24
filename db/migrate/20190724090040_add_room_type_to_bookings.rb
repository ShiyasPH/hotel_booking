class AddRoomTypeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :room_type, :string
  end
end
