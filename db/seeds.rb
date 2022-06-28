# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"


puts "Cleaning application database..."
Application.destroy_all

puts "Cleaning pet database..."
Pet.destroy_all

puts "Cleaning user database..."
User.destroy_all


puts "Cleaning shelter database..."
Shelter.destroy_all


puts "Creating shelter user... "

jane = User.create!(email: "jane@gmail.com",
                    password: "123456",
                    first_name: "Jane",
                    last_name: "Hopper")
file = URI.open('https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
jane.photo.attach(io: file, filename: 'jane_profile.png', content_type: 'image/png')
puts "Created jane"

lucy = User.create!(email: "lucy@gmail.com",
                    password: "123456",
                    first_name: "Lucy",
                    last_name: "Bryant")
file = URI.open('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
lucy.photo.attach(io: file, filename: 'lucy_profile.png', content_type: 'image/png')
puts "Created lucy"

puts "Creating adopter user... "

mike = User.create!(email: "mike@gmail.com",
                    password: "123456",
                    first_name: "Mike",
                    last_name: "Smith",
                    age: "26",
                    occupation: "Teacher",
                    biography: "My partner and I are looking for a dog to adopt.",
                    type_of_dwelling: "Flat",
                    outdoor_space: false,
                    other_cats: true,
                    other_dogs: false,
                    children: false,
                    hours_alone: 4,
                    previous_experience: "I've had dogs since I was 5 and am very experienced with them.")
file = URI.open('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
mike.photo.attach(io: file, filename: 'mike_profile.png', content_type: 'image/png')
puts "Created mike"

jenny = User.create!(email: "jenny@gmail.com",
                     password: "123456",
                     first_name: "Jenny",
                     last_name: "Hughes",
                     age: "40",
                     occupation: "Architect",
                     biography: "My huband and I have two young children who are all very keen to adopt a young dog.",
                     type_of_dwelling: "House",
                     outdoor_space: true,
                     other_cats: false,
                     other_dogs: false,
                     children: true,
                     hours_alone: 5,
                     previous_experience: "I've never had cats but my husband has had them all through his life.")
file = URI.open('https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
jenny.photo.attach(io: file, filename: 'jane_profile.png', content_type: 'image/png')
puts "Created jenny"

derek = User.create!(email: "derek@gmail.com",
                     password: "123456",
                     first_name: "Derek",
                     last_name: "Zhang",
                     age: "32",
                     occupation: "Software Developer",
                     biography: "I'm a freelancer who mostly works from home and I'm looking for a cat to adopt.",
                     type_of_dwelling: "Flat",
                     outdoor_space: true,
                     other_cats: false,
                     other_dogs: false,
                     children: false,
                     hours_alone: 2,
                     previous_experience: "Unfortunately, I've never had cats before.")
file = URI.open('https://images.unsplash.com/photo-1584673392125-f91e13c6a3cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
derek.photo.attach(io: file, filename: 'derek_profile.png', content_type: 'image/png')
puts "Created derek"

puts "All users created"


puts "Creating shelters... "

shoreditch = Shelter.create!(name: "Shoreditch Rescue",
                             address: "229 Bethnal Green Road, Tower Hamlets, London, E2 7DG, United Kingdom",
                             description: "We are based in Shoreditch and rescue both dogs and cats in the East London area.",
                             user: jane)

puts "Created shoreditch shelter"

city = Shelter.create!(name: "London Inner City Shelter",
                       address: "12 Roger St, London WC1N 2JU",
                       description: "Several animal lovers with many years’ rescue experience and a shared vision for London formed the shelter to merge resources to help animals in need, especially those overlooked and in the most need of medical attention and long-term fostering.",
                       user: lucy)
puts "Created city shelter"
puts "All shelters created"


puts "Creating pets..."

pixel = Pet.create!(adoption_status: "Available",
                    name: "Pixel",
                    species: "Dog",
                    breed: "Labrador Retriever",
                    sex: "Male",
                    age: "6 months",
                    colour: "Black",
                    description: "Pixel is a typical playful pup who is a sweet little boy.",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: true,
                    children: true,
                    hours_alone: 2,
                    medical_conditions: "In good health condition",
                    shelter: shoreditch)

file = URI.open('https://i.pinimg.com/originals/00/b3/11/00b31198df2ec1d8089d0ba06c09705b.jpg')
pixel.photos.attach(io: file, filename: 'pixel_1.jpg', content_type: 'image/jpg')
file = URI.open('https://www.akc.org/wp-content/uploads/2020/09/Labrador-retriever-puppy-sitting-in-the-grass.jpeg')
pixel.photos.attach(io: file, filename: 'pixel_2.jpg', content_type: 'image/jpg')

puts "Created pixel"

blanca = Pet.create!(adoption_status: "Available",
                     name: "Blanca",
                     species: "Cat",
                     breed: "Persian",
                     sex: "Female",
                     age: "1 year",
                     colour: "White",
                     description: "Blanca is very purry and has a soft meow. She craves attention and loves to be stroked and to curl up against her human. She is OK to live with older children.",
                     outdoor_space: false,
                     other_cats: true,
                     other_dogs: false,
                     children: true,
                     hours_alone: 6,
                     medical_conditions: "In good health condition",
                     shelter: shoreditch)

file = URI.open('https://assets.pets4homes.co.uk/image/e5a10239-c642-49da-9e00-a1e7384f1e28/938x527/persian-cats-for-sale-3-year-old-persian-cat-lightfoot-green-preston-image-1.webp?width=1440')
blanca.photos.attach(io: file, filename: 'blanca_1.jpg', content_type: 'image/jpg')
file = URI.open('https://assets.pets4homes.co.uk/image/90aa3454-f641-491e-a17f-993d935c966e/938x527/persian-cats-for-sale-3-year-old-persian-cat-lightfoot-green-preston-image-2.webp?width=1440')
blanca.photos.attach(io: file, filename: 'blanca_2.jpg', content_type: 'image/jpg')
file = URI.open('https://assets.pets4homes.co.uk/image/47cb1f6d-acfc-40b1-a11a-28899a972c80/938x527/persian-cats-for-sale-3-year-old-persian-cat-lightfoot-green-preston-image-3.webp?width=1280')
blanca.photos.attach(io: file, filename: 'blanca_3.jpg', content_type: 'image/jpg')

puts "Created blanca"

muffin = Pet.create!(adoption_status: "Adopted",
                     name: "Muffin",
                     species: "Dog",
                     breed: "Chihuahua",
                     sex: "Female",
                     age: "11 years",
                     colour: "Cream",
                     description: "Muffin came to us due to her owner's ill health. Muffin loves attention but can also be independent. She doesn't like loud noises so will need a relatively quiet home.",
                     outdoor_space: false,
                     other_cats: false,
                     other_dogs: false,
                     children: false,
                     hours_alone: 6,
                     medical_conditions: "In good health condition",
                     shelter: shoreditch)

file = URI.open('https://ilovemychi.com/wp-content/uploads/2015/03/Renee-Goertz.jpg.webp')
muffin.photos.attach(io: file, filename: 'muffin_1.jpg', content_type: 'image/jpg')
file = URI.open('https://ilovemychi.com/wp-content/uploads/2015/03/Aunetti-Smith.jpg.webp')
muffin.photos.attach(io: file, filename: 'muffin_2.jpg', content_type: 'image/jpg')
file = URI.open('https://ilovemychi.com/wp-content/uploads/2015/03/2-sleeping-chi-pups.jpg.webp')
muffin.photos.attach(io: file, filename: 'muffin_3.jpg', content_type: 'image/jpg')
file = URI.open('https://ilovemychi.com/wp-content/uploads/2015/03/Adela-Mendoza.jpg.webp')
muffin.photos.attach(io: file, filename: 'muffin_4.jpg', content_type: 'image/jpg')
file = URI.open('https://ilovemychi.com/wp-content/uploads/2015/03/Amahra-Davis.jpg.webp')
muffin.photos.attach(io: file, filename: 'muffin_5.jpg', content_type: 'image/jpg')


puts "Created muffin"

spike = Pet.create!(adoption_status: "Reserved",
                    name: "Spike",
                    species: "Cat",
                    breed: "Domestic Shorthair",
                    sex: "Male",
                    age: "7 years",
                    colour: "Black and white",
                    description: "Spike is a very active and independent cat, who used to live on a farm so he's used to exploring outdoors. He is very affectionate and loves to be petted.",
                    outdoor_space: true,
                    other_cats: true,
                    other_dogs: true,
                    children: true,
                    hours_alone: 8,
                    medical_conditions: "None known",
                    shelter: shoreditch)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20190714-WA0009_fe7euo.jpg')
spike.photos.attach(io: file, filename: 'spike_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304130/pet%20pics/PXL_20220418_195133993.PORTRAIT_besozb.jpg')
spike.photos.attach(io: file, filename: 'spike_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304908/pet%20pics/IMG_20191228_153340_in7yzk.jpg')
spike.photos.attach(io: file, filename: 'spike_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210529_111800199_owqvtg.jpg')
spike.photos.attach(io: file, filename: 'spike_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210530_134601143_os9bck.jpg')
spike.photos.attach(io: file, filename: 'spike_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304366/pet%20pics/PXL_20211227_183651097_hxfa0e.jpg')
spike.photos.attach(io: file, filename: 'spike_6.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20190109-WA0007_eoispe.jpg')
spike.photos.attach(io: file, filename: 'spike_7.jpg', content_type: 'image/jpg')

puts "Created spike"

laika = Pet.create!(adoption_status: "Available",
                    name: "Laika",
                    species: "Dog",
                    breed: "Border Collie",
                    sex: "Female",
                    age: "9 years",
                    colour: "Black and white",
                    description: "Intelligent and energetic dog despite her age. She loves walking.",
                    outdoor_space: true,
                    other_cats: false,
                    other_dogs: true,
                    children: true,
                    hours_alone: 4,
                    medical_conditions: "Needs medication once a day",
                    shelter: city)

file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220530112142_oscarcollienew_800.jpg')
laika.photos.attach(io: file, filename: 'laika_1.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035536_oscarcollienew004_800.jpg')
laika.photos.attach(io: file, filename: 'laika_2.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035531_oscarcollienew001_800.jpg')
laika.photos.attach(io: file, filename: 'laika_3.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035533_oscarcollienew002_800.jpg')
laika.photos.attach(io: file, filename: 'laika_4.jpg', content_type: 'image/jpg')

puts "Created laika"

luna = Pet.create!(adoption_status: "Adopted",
                   name: "Luna",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Female",
                   age: "6 years",
                   colour: "Black and white",
                   description: "Luna is a chilled cat who is affectionate and will purr a lot, although she can get overexcited. She's not very motivated by food but will still meow for it.",
                   outdoor_space: false,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 6,
                   medical_conditions: "She has heart murmurs which need to be checked up at the vet regularly",
                   shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210412_113037977.PORTRAIT_1_r7bc8k.jpg')
luna.photos.attach(io: file, filename: 'luna_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304356/pet%20pics/PXL_20220530_200227808_nuvsh2.jpg')
luna.photos.attach(io: file, filename: 'luna_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304908/pet%20pics/IMG_20180228_194657_iv7ejw.jpg')
luna.photos.attach(io: file, filename: 'luna_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210418_022803035_ly78za.jpg')
luna.photos.attach(io: file, filename: 'luna_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304536/pet%20pics/PXL_20210411_214640539.PORTRAIT_sjuac4.jpg')
luna.photos.attach(io: file, filename: 'luna_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1655304907/pet%20pics/IMG-20180317-WA0000_dtvajb.jpg')
luna.photos.attach(io: file, filename: 'luna_6.jpg', content_type: 'image/jpg')

puts "Created luna"

memphis = Pet.create!(adoption_status: "Reserved",
                      name: "Memphis",
                      species: "Dog",
                      breed: "Lurcher",
                      sex: "Male",
                      age: "9 months",
                      colour: "Grey",
                      description: "Memphis is a very nice young dog who came to us as a stray, and he has become friendly and sociable.",
                      outdoor_space: true,
                      other_cats: true,
                      other_dogs: true,
                      children: true,
                      hours_alone: 3,
                      medical_conditions: "None known",
                      shelter: city)

file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/9cozum9ajd9meu3pzd8tim63l5t8_mqaynr.jpg')
memphis.photos.attach(io: file, filename: 'memphis_1.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/uxdfc592z0ndlwk3yb7856iuncxy_bkezhp.jpg')
memphis.photos.attach(io: file, filename: 'memphis_2.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/090zsyi4x8mh0anc8funikc4ignk_hqx0q0.jpg')
memphis.photos.attach(io: file, filename: 'memphis_3.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/r5c323jjqhbqy8bnab8n2j4kcquy_islgem.jpg')
memphis.photos.attach(io: file, filename: 'memphis_4.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/xrwykqpvides179zla9x9zobzmd7_b9yowq.jpg')
memphis.photos.attach(io: file, filename: 'memphis_5.jpg', content_type: 'image/jpg')
file = URI.open('https://res.cloudinary.com/soojinhwang/image/upload/v1656441499/pet%20pics/xrhsestwmtjx6mstevtv3xokhje7_mzadnh.jpg')
memphis.photos.attach(io: file, filename: 'memphis_6.jpg', content_type: 'image/jpg')

puts "Created memphis"

abla = Pet.create!(adoption_status: "Available",
                   name: "Abla",
                   species: "Cat",
                   breed: "Domestic Shorthair",
                   sex: "Female",
                   age: "8 years",
                   colour: "Calico",
                   description: "Abla is quirky and vocal and has lots of fun to bring to her new family. Abla is a bit chunky so her new people will need to keep an eye on her food, and encourage her to move around. She loves to play and chase toys. She can live with older children and teenagers.",
                   outdoor_space: true,
                   other_cats: false,
                   other_dogs: false,
                   children: true,
                   hours_alone: 6,
                   medical_conditions: "None known",
                   shelter: city)

file = URI.open('https://www.battersea.org.uk/sites/default/files/animal_images/00P8e000001F1KdEAK.jpeg')
abla.photos.attach(io: file, filename: 'abla_1.jpg', content_type: 'image/jpg')
file = URI.open('https://www.battersea.org.uk/sites/default/files/animal_images/00P8e000001F1KdEAK.jpeg')
abla.photos.attach(io: file, filename: 'abla_2.jpg', content_type: 'image/jpg')
file = URI.open('https://www.battersea.org.uk/sites/default/files/animal_images/00P8e000001F1KiEAK.jpeg')
abla.photos.attach(io: file, filename: 'abla_3.jpg', content_type: 'image/jpg')
file = URI.open('https://www.battersea.org.uk/sites/default/files/animal_images/00P8e000001F1L7EAK.jpeg')
abla.photos.attach(io: file, filename: 'abla_4.jpg', content_type: 'image/jpg')
puts "Created abla"

puts "All pets created"

require 'date'
puts "Creating applications..."

app1 = Application.create!(user: mike,
                           pet: pixel,
                           date: Date.today,
                           approved: false,
                           reviewed: false)

app2 = Application.create!(user: jenny,
                           pet: memphis,
                           date: Date.today,
                           approved: false,
                           reviewed: false)

puts "All applications created"
