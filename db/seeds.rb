# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users

User.create!(email:  "ce14b068@smail.iitm.ac.in",
             password:  "shiyas",
             password_confirmation:  "shiyas")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(email:  email,
               password:  password,
               password_confirmation:  password)
end

# Hotels

10.times do |n|
  description = Faker::Lorem.paragraph_by_chars(110)
  Hotel.create!(name: "ABC#{n+1} hotel",
                description: description)
end

# Rooms

10.times do |hotelcount|
  30.times do |n|
    if n < 10
      room_type = "Single room"
      price = 1000
    elsif n < 20
      room_type = "Double room"
      price = 2000
    else
      room_type = "Triple room"
      price = 3000
    end
    Room.create!(hotel_id:  hotelcount+1,
                 room_number:  n+1,
                 room_type:  room_type,
                 price:  price)
  end
end

# Bookings

5.times do |n1|
  20.times do |n2|
    if n2 < 10
      room_type = "Single room"
      price = 1000
    else n2 < 20
      room_type = "Double room"
      price = 2000
    end
    Booking.create!(user_id:  20*n1+n2+1,
                    room_id:  n1*30+n2+1,
                    room_type:  room_type,
                    guest_name:  Faker::Name.name,
                    start_date:  Date.today,
                    end_date:  Date.today+30)
  end
end

5.times do |n1|
  10.times do |n2|
    if n2 < 5
      room_type = "Single room"
      room_id = 150 + n1*30 + n2 + 1
    else
      room_type = "Double room"
      room_id = 150 + n1*30 + n2 + 6
    end
    Booking.create!(user_id:  10*n1+n2+1,
                    room_id: room_id,
                    room_type:  room_type,
                    guest_name:  Faker::Name.name,
                    start_date:  Date.today,
                    end_date:  Date.today+30)
  end
end