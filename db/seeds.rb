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


Review.destroy_all
User.destroy_all
Sunset.destroy_all
Place.destroy_all
City.destroy_all
Booking.destroy_all

# SEED CITY
lisbon = City.create(name: 'Lisbon', latitude: 38.736946, longitude: -9.142685)

# SEED WEATHER & SUNSETS
WEATHER = [{description: 'Clear',
            icon:'http://openweathermap.org/img/wn/01d@2x.png'
           },
           { description:'Broken clouds',
             icon: 'http://openweathermap.org/img/wn/04d@2x.png'
          },

           { description:'Scattered clouds',
             icon: 'http://openweathermap.org/img/wn/03d@2x.png'
          },
           { description:'Light rain',
             icon: 'http://openweathermap.org/img/wn/10d@2x.png'
          }]

# TODAY AND FUTURE SUNSETS
d = Date.today
m = 14
10.times do
  weather_arr = WEATHER.sample
  Sunset.create(city: lisbon,
                start: "5:#{m.round}pm",
                end: "5:#{m.round + 3}pm",
                gold_start: "4:#{m.round + 22}pm",
                date: d,
                description: weather_arr[:description],
                icon: weather_arr[:icon],
                tempmin: "#{rand(9..13)}°C",
                tempmax: "#{rand(15..18)}°C"
                )
  m += 0.3
  d += 1
end

# PAST SUNSET

d = Date.today
d -= 5
weather_arr = WEATHER.sample
Sunset.create(city: lisbon,
              start: "5:#{m.round}pm",
              end: "5:#{m.round + 3}pm",
              gold_start: "4:#{m.round + 22}pm",
              date: d,
              description: weather_arr[:description],
              icon: weather_arr[:icon],
              tempmin: "#{rand(9..13)}°C",
              tempmax: "#{rand(15..18)}°C"
              )

# PLACES SEED

PLACES = [{ name: 'Miradouro Santa Luzia',
            image: 'https://img.theculturetrip.com/768x432/wp-content/uploads/2017/03/shutterstock_603926126-ttstudio.jpg',
            address: 'R. Norberto de Araújo 22A, 1100-117 Lisboa',
            city: lisbon,
            description: 'This popular observation deck with a pergola offers dramatic views of Lisbon & the Tagus River.  This romantic terrace by the church of Santa Luzia introduces visitors to Alfama with a sweeping view over its houses, churches, and the Tagus River. The café on the terrace is a good place for a drink before climbing to the castle nearby.'
            #
          },

          { name: 'Cais das Colunas',
            image: 'https://voss-photography.com/wp-content/uploads/2017/11/lissabon-cais-das-colunas-sonnenuntergang.jpg?7f1c30',
            address: 'Praça do Comércio, Lisboa',
            city: lisbon,
            description: 'Its by Commerce Square, on the Quay of the Columns, which tourists are most often surprised by the colors of the Lisbon sky at dusk, especially in the fall. It is next to Praça do Comércio, in Cais das Colunas, that tourists are most surprised by the colors of the Lisbon sky at dusk, especially in the fall.'
          },

          { name: 'Miradouro da Senhora do Monte',
            image: 'https://sumfinity.com/wp-content/uploads/2019/02/Sunset-View-Lisbon-Portugal-evening.jpg',
            address: 'Largo Monte, Lisbon',
            city: lisbon,
            description: 'Perched upon a hillside in the Graca neighbourhood, Miradouro da Senhora do Monte, (Our Lady of the Hill), looks out over Lisbon and is the citys highest lookout point or miradouro. With such a position it means it offers uninterrupted 250 degree panoramic views across Lisbon from the stunning old quarters and castle to the downtown district of the city and beyond.'
          },

          { name: 'Hotel Mundial',
            image: 'https://www.publituris.pt/wp-content/uploads/2017/05/Rooftop-12.jpg',
            address: 'Praça Martim Moniz 2',
            city: lisbon,
            description: 'The Hotel Mundial Rooftop Bar lights up after sunset until late at night in Martim Moniz hosting its famous sunset parties. Attendees can expect a DJ and sunset party every Friday. Chill Out Sessions are held every Wednesday and Yoga Sessions on Sunday.'
          },

          { name: 'Amooreiras 360 Panoramic View',
            image: "https://i2.wp.com/infocul.pt/wp-content/uploads/2017/04/Amoreiras-360%C3%82%C2%BA-Panoramic-View-Dia-Internacional-dos-Monumentos-e-S%C3%83%C2%ADtios.jpg?resize=800%2C534",
            address: 'R. Carlos Alberto da Mota Pinto 72, 1250-096 Lisboa',
            city: lisbon,
            description: 'Lisbons highest viewpoint is waiting for you with a unique view over the portuguese capital and its most iconic landmarks. An exceptional experience on the top of the Amoreiras Shopping Center which is in itself one of the highlights of the citys landscape and shopping experience. Open everyday.'
            #
          },

          { name: 'Miradouro do Monte Agudo',
            image:'https://i1.wp.com/boasnoticias.pt/wp-content/uploads/2016/11/monte1.jpg?fit=666%2C333&ssl=1',
            address: 'Miradouro do Monte Agudo',
            city: lisbon,
            description: 'Imagine a forest park with a simple terrace. Imagine also a space where there is peace and a fantastic view of Lisbon… another option is to stop imagining, escape the urban movement and climb to Monte Agudo, a perfect viewpoint for a day spent well. The Monte Agudo viewpoint is a modest place, embraced by nature where there is a permanent invitation for a city escape. Whether it is a relaxed afternoon or evening with friends or simply alone, the viewpoint is ideal for any occasion when you want a panoramic view of the city of the seven hills. The Monte Agudo viewpoint is a cool place to be at dusk.'
          },

          { name: 'Alameda',
            image: 'https://media2.trover.com/T/547fe68bd809d85c0b00036e/fixedw_large_4x.jpg',
            address: 'Alameda Dom Afonso Henriques',
            city: lisbon,
            description: 'Alameda is definitely an off the beaten path location, although it offers one of the most spacious places within the city. On top of the impressive fountain Fonte Luminosa there is a balcony overlooking the Alameda square. If you go further and climb up the hill behind the balcony, you’ll find one of the hidden sunset spots of Lisbon.'
          },

          { name:'Restaurante Panorâmico de Monsanto',
            image:'https://www.panorama-restaurante.com/pt/resourcefiles/homeimages/panorama-restaurante_1.jpg',
            address: 'Estr. da Bela Vista 100, Lisboa',
            city: lisbon,
            description: 'The Panoramic Restaurant of Monsanto is a building located in Montes Claros, in Monsanto, Lisbon, built in the Estado Novo. The building is by the architect Chaves Costa. It is a circular building with a radius of 16 meters, five floors and a panoramic view of 270 degrees. After decades of abandonment, it was converted into a municipal viewpoint.'
            #
          },

          { name:'Miradouro Portas do Sol',
            image:'https://img.theculturetrip.com/768x432/wp-content/uploads/2017/01/porto-1972486_1920.jpg',
            address: 'Largo Portas do Sol, 1100-411 Lisboa',
            city: lisbon,
            description: 'Just a few steps from Miradouro de Santa Luzia, a balcony opens onto the river, offering truly spectacular views over Alfama. Faced by soft-toned buildings and the Decorative Arts Museum, this is a popular stop for photographers, with its stunning view from São Vicente de Fora Monastery to the waterfront.'

          },

          { name:'Lost In Esplanada Bar',
            image:'https://media-cdn.tripadvisor.com/media/photo-s/11/37/ef/f9/terraco-coberto-panoramico.jpg',
            address: 'R. Dom Pedro V 56B, 1250-094 Lisboa',
            city: lisbon,
            description: 'Its easy to lose track of time as we step into the open space of the terrace, just behind the Lost In. The view, one of the best in town, is all we can want to follow a menu that goes from natural juices to sangrias, of course, for wines and cocktails.'
            #
          }]

PLACES.each do |place|
  Place.create(
      name: place[:name],
      image: place[:image],
      address: place[:address],
      city: lisbon,
      description: place[:description]
    )
end

Place.create(name: 'Park Bar',
           description: 'Chilled vibes on a rooftop of a car park. Amazing view and great interior. Really cool bar, with good music. I’d definitely recommend coming here on your visit to Lisbon. I came when it was dark but I can imagine the view is even more amazing during the day or sunset.',
           address: '58 Bairro Alto Lisbon',
           image: 'https://portugalconfidential.com/wp-content/uploads/2014/04/Park-Restaurante-Bar-Lisbon-1.jpg',
           city: lisbon)

# Create User
User.create(first_name: 'Nick',
            email: 'n.galluzzo@gmail.com',
            password: 'password'
            )
User.create(first_name: 'Joao',
            email: 'joao@gmail.com',
            password: 'password'
            )
User.create(first_name: 'Emily',
            email: 'emily@gmail.com',
            password: 'password'
            )

# Create Booking
d = Date.today
d -= 2
Booking.create(place: Place.where(name: 'Alameda')[0],
               date: d,
               name: 'Beers at Sunset',
               user: User.first,
               description: 'I want to get everyone together from Le Wagon for one last epic rager.  Might get a little cold after the sun goes down, so bring a jacket.'
               )
Booking.create(place: Place.where(name: 'Alameda')[0],
               date: d,
               name: 'Romantic Night',
               user: User.find_by(first_name: 'Joao'),
               description: 'Lets celebrate our anniversary while watching the sunset.  I will bring champagne.'
               )
Booking.create(place: Place.where(name: 'Miradouro do Monte Agudo')[0],
               date: Date.today,
               name: 'Work Anniversary Party',
               user: User.find_by(first_name: 'Emily'),
               description: 'Celebrating 2 years at Le Wagon!  Heres to at least 2 more!'
               )
d = (Date.today + 3)
Booking.create(place: Place.where(name: 'Hotel Mundial')[0],
               date: d,
               name: 'Ruby Meetup at Sunset',
               user: User.first,
               description: 'Drinkathon and hackathon, all Ruby, all night, starting at sunset.'
               )
d = (Date.today + 5)
Booking.create(place: Place.where(name: 'Lost In Esplanada Bar')[0],
               date: d,
               name: 'Graduation from Le Wagon',
               user: User.first,
               description: 'Want to wish everyone a great job on 9 weeks of hard work.  We should be proud so lets celebrate with a sunset.'
               )

# Create Reviews
Review.create(rating: 4,
              booking: Booking.first,
              user: User.find_by(first_name: 'Joao'),
              content: 'This was an excellent time! Loved this location.  Great drink specials nearby.',
              image: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-540x360/09/90/5e/99.jpg'
              )
Review.create(rating: 5,
              booking: Booking.first,
              user: User.last,
              content: 'Ive been coming here for a long time.  Would sunset here again, for sure.',
              image: 'https://www.viva-porto.pt/wp-content/uploads/2019/08/beer_sunset_ent.jpg'
              )

puts "Seeding Completed!"
