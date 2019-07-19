# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users

User.create!(name:  "ce14b068",
             email:  "ce14b068@smail.iitm.ac.in",
             password:  "shiyas",
             password_confirmation:  "shiyas")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email:  email,
               password:  password,
               password_confirmation:  password)
end

# Hotels

10.times do |n|
  Hotel.create!(name: "ABC#{n+1} hotel")
  puts 'created'
end

# Rooms

hotels = Hotel.order(:created_at)
50.times do |n|
  if n<20
    room_type = 1
    price = 1000
  elsif n<40
    room_type = 2
    price = 2000
  else
    room_type = 3
    price = 3000
  end
  hotels.each { |hotel| hotel.rooms.create!(room_number:  n+1,
                                            room_type:  room_type,
                                            price:  price) }
end

# Bookings

10.times do |n1|
  10.times do |n2|
    user_id = n1*10 + n2 + 1
    Booking.create!(user_id:  user_id,
                     hotel_id:  n1+1,
                     guest_name:  Faker::Name.name,
                     start_date:  Date.today,
                     end_date:  Date.today)
  end
end

# Bookings_rooms

10.times do |n1|
  10.times do |n2|
    booking_id = n1*50 + n2 + 1
    BookingsRoom.create!(booking_id:  booking_id,
                           room_id:  n1+1)
  end
end