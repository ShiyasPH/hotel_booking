class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :hotel, foreign_key: true
      t.string :guest_name
      t.timestamps
    end
  end
end