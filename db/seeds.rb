# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Shelter.destroy_all
Pet.destroy_all
Application.destroy_all

puts "creating users... "

jane = User.create!(email: "jane@gmail.com",
                    password: "123456",
                    first_name: "Jane",
                    last_name: "Hopper")
                    # age: 30,
                    # biography: "I'm a volunteer",
                    # type_of_dwelling: "House",
                    # outdoor_space: true,
                    # other_pets: "yes I have plenty",
                    # children: "none",
                    # hours_alone: 1,
                    # previous_experience: "yes spent 10 years working with pets"

puts "Created jane"

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
                    previous_experience: "I've had dogs since I was 5.")

puts "Created mike"
puts "All users created"

puts "creating users... "

shoreditch = Shelter.create!()

# puts "creating pets.."

# Pet.create! m (adoption_status: "Available for adoption"
#             name: "Pixel"
#             species: "Dog"
#             breed: "crossbreed"
#             sex: "male"
#              age: "six months"
#              colour: "black"
#              description: "Pixel is a typical playful pup who is a sweet little boy."
#              outdoor_space: true
#              pet_friendly: "Yes"
#              children_friendly: "Yes"
#              hours_alone: 3
#              medical_conditions: "Good health condition"
# )

# puts "pet created.."
