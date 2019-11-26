# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user1 = User.create(email: 'test@gmail.com', first_name: 'nick', password:'test123')
# Location.create(city: 'lisbon', user_id: user1.id)
require 'time'
require 'date'

City.destroy_all
Place.destroy_all


lisbon = City.create(name: 'Lisbon', latitude: 38.736946, longitude: -9.142685)


park_bar = Place.new(name: 'Park Bar', description: 'Super cool', address: 'Calçada do Combro, 58 Bairro Alto Lisbon', image: 'https://portugalconfidential.com/wp-content/uploads/2014/04/Park-Restaurante-Bar-Lisbon-1.jpg')
park_bar.city = lisbon
park_bar.save!

d = Date.today
3.times do
Sunset.create(city: city.first,
              start: '5:15pm',
              end: '5:30pm',
              gold_start: '4:00pm',
              gold_end: '6:00pm',
              date: d
              )
d += 1
end


