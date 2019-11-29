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

lisbon = City.create(name: 'Lisbon', latitude: 38.736946, longitude: -9.142685)
WEATHER = ['clear', 'broken clouds', 'scatered clouds', 'light rain']

PLACES = [{ name: 'Miradouro Santa Luzia',
            image: 'https://img.theculturetrip.com/768x432/wp-content/uploads/2017/03/shutterstock_603926126-ttstudio.jpg',
            address: 'Largo Santa Luzia, Lisbon',
            city: lisbon,
            description: Faker::ChuckNorris.fact
          },

          { name: 'Cais das Colunas',
            image: 'https://voss-photography.com/wp-content/uploads/2017/11/lissabon-cais-das-colunas-sonnenuntergang.jpg?7f1c30',
            address: 'Cais das Colunas',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name: 'Miradouro da Senhora do Monte',
            image: 'https://sumfinity.com/wp-content/uploads/2019/02/Sunset-View-Lisbon-Portugal-evening.jpg',
            address: 'Largo Monte, Lisbon',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name: 'Hotel Mundial',
            image: 'https://www.publituris.pt/wp-content/uploads/2017/05/Rooftop-12.jpg',
            address: 'Praça Martim Moniz 2',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name: 'Amooreiras 360 Panoramic View',
            image: "https://i2.wp.com/infocul.pt/wp-content/uploads/2017/04/Amoreiras-360%C3%82%C2%BA-Panoramic-View-Dia-Internacional-dos-Monumentos-e-S%C3%83%C2%ADtios.jpg?resize=800%2C534",
            address: 'Amoreiras Shopping Center, Av. Eng. Duarte Pacheco 1070',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name: 'Miradouro do Monte Agudo',
            image:'https://i1.wp.com/boasnoticias.pt/wp-content/uploads/2016/11/monte1.jpg?fit=666%2C333&ssl=1',
            address: 'Miradouro do Monte Agudo',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name: 'Alameda',
            image: 'https://media2.trover.com/T/547fe68bd809d85c0b00036e/fixedw_large_4x.jpg',
            address: lisbon,
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name:'Restaurante Panorâmico de Monsanto',
            image:'https://www.panorama-restaurante.com/pt/resourcefiles/homeimages/panorama-restaurante_1.jpg',
            address: 'Estr. da Bela Vista',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name:'Miradouro Portas do Sol',
            image:'https://img.theculturetrip.com/768x432/wp-content/uploads/2017/01/porto-1972486_1920.jpg',
            address: 'Miradouro da Senhora do Monte, Lisbon',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          },

          { name:'Lost in Esplanada Bar',
            image:'https://media-cdn.tripadvisor.com/media/photo-s/11/37/ef/f9/terraco-coberto-panoramico.jpg',
            address: 'R. Dom Pedro V Nº56-D',
            city: lisbon,
            description: Faker::ChuckNorris.fact

          }

]


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
           description: Faker::ChuckNorris.fact,
           address: '58 Bairro Alto Lisbon',
           image: 'https://portugalconfidential.com/wp-content/uploads/2014/04/Park-Restaurante-Bar-Lisbon-1.jpg',
           city: lisbon)


# dweather and sunset seeds


d = Date.today
10.times do
Sunset.create(city: lisbon,
              start: "5:#{rand(10..27)}pm",
              end: "5:#{rand(35..45)}pm",
              gold_start: "4:#{rand(40..59)}pm",
              date: d,
              description: WEATHER.sample,
              tempmin: "#{rand(32..50)}°F",
              tempmax: "#{rand(51..72)}°F"
              )
d += 1
end
puts "Seeding Completed!"

