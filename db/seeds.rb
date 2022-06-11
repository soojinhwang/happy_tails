# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

puts "Created laika"
puts "All pets created"


require 'date'
puts "Creating applications..."

app1 = Application.create!(user: mike,
                           pet: pixel,
                           date: Date.today,
                           approved: false)

puts "All applications created"
