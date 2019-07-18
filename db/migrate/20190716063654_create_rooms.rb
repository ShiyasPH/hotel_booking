class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.string :room_number
      t.integer :price
      t.integer :room_type
      t.timestamps
    end
  end
end
