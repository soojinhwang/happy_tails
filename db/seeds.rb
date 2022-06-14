# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Cleaning user database..."
User.destroy_all

puts "Cleaning pet database..."
Pet.destroy_all

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

puts "Creating adopter user... "

mike = User.create!(email: "mike@gmail.com",
                    password: "123456",
                    first_name: "Mike",
                    last_name: "Smith",
                    age: "26",
                    biography: "My partner and I are looking for a dog to adopt",
                    type_of_dwelling: "Flat",
                    outdoor_space: false,
                    other_pets: "I have a cat",
                    children: "None",
                    hours_alone: 4,
                    previous_experience: "I've had dogs since I was 5 and am very experienced with them.")
file = URI.open('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
mike.photo.attach(io: file, filename: 'mike_profile.png', content_type: 'image/png')
puts "Created mike"
puts "All users created"


puts "Creating shelters... "

shoreditch = Shelter.create!(name: "Shoreditch Rescue",
                             address: "229 Bethnal Green Road, Tower Hamlets, London, E2 7DG, United Kingdom",
                             description: "We are based in Shoreditch and rescue both dogs and cats in the East London area.",
                             user: jane)

puts "Created shoreditch shelter"
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
                    pet_friendly: "Yes",
                    children_friendly: "Yes",
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
                     description: "Blanca is very purry and has a soft meow. She craves attention and loves to be stroked and to curl up against her human.",
                     outdoor_space: false,
                     pet_friendly: "Only other cats",
                     children_friendly: "OK with older childen",
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

laika = Pet.create!(adoption_status: "Available",
                    name: "Laika",
                    species: "Dog",
                    breed: "Border Collie",
                    sex: "Female",
                    age: "9 years",
                    colour: "Black and white",
                    description: "Intelligent and energetic dog despite her age. She loves walking.",
                    outdoor_space: true,
                    pet_friendly: "Only other dogs",
                    children_friendly: "Yes",
                    hours_alone: 4,
                    medical_conditions: "Needs medication once a day",
                    shelter: shoreditch)

file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220530112142_oscarcollienew_800.jpg')
laika.photos.attach(io: file, filename: 'laika_1.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035536_oscarcollienew004_800.jpg')
laika.photos.attach(io: file, filename: 'laika_2.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035531_oscarcollienew001_800.jpg')
laika.photos.attach(io: file, filename: 'laika_3.jpg', content_type: 'image/jpg')
file = URI.open('https://www.dogstrust.org.uk/dogimages/1106219_oscar_20220529035533_oscarcollienew002_800.jpg')
laika.photos.attach(io: file, filename: 'laika_4.jpg', content_type: 'image/jpg')

puts "Created laika"
puts "All pets created"


require 'date'
puts "Creating applications..."

app1 = Application.create!(user: mike,
                           pet: pixel,
                           date: Date.today,
                           approved: false)

puts "All applications created"
