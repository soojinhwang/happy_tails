# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating user who is a shelter... "

User.create!(email: "shelter2022@gmail.com",
             password: "shelter2022",
             first_name: "Jane",
             last_name: "Hopper",
             age: 30,
             shelter: true,
             biography: "A shelter in Shoreditch looking to use Happy tails.",
             type_of_dwelling: "House",
             outdoor_space: true,
             other_pets: "yes I have plenty",
             children: "none",
             hours_alone: 1,
             previous_experience: "yes spent 10 years working with pets"
             )

puts "user shelter created.."

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
