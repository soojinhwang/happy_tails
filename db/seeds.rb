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


puts "creating user who is a shelter... "

user1 = User.create!(email: "shelter2022@gmail.com",
  password: "shelter2022",
  first_name: "Jane",
  last_name: "Hopper",
  age: 30,
 #  shelter: true,
  biography: "A shelter in Shoreditch looking to use Happy Tails.",
  type_of_dwelling: "House",
  outdoor_space: true,
  other_pets: "yes I have plenty",
  children: "none",
  hours_alone: 1,
  previous_experience: "yes spent 10 years working with pets"
  )

puts "user shelter created.."

shelter1 = Shelter.create!

puts "creating user who is not a shelter... "

User.create!(email: "sarahsmith@gmail.com",
  password: "awesome2022",
  first_name: "Sarah",
  last_name: "Smith",
  age: 27,
  shelter: false,
  biography: "Animal lover looking for adopting a cat",
  type_of_dwelling: "house",
  outdoor_space: true,
  other_pets: "yes, I have a dog",
  children: "none",
  hours_alone: 3,
  previous_experience: "yes spent 3 years volunteering with pets"
  )

  puts " non shelter user created.."

  puts "creating pet.."

pet1 = Pet.new(adoption_status: "Available",
             name: "Pixel",
             species: "Dog",
             breed: "crossbreed",
             sex: "male",
             age: "six months",
             colour: "black",
             description: "Pixel is a typical playful pup who is a sweet little boy.",
             outdoor_space: true,
             pet_friendly: "Yes",
             children_friendly: "Yes",
             hours_alone: 3,
             medical_conditions: "Good health condition"
             )

pet1.save!

puts "#{pet1.name} created.."


pet2 = Pet.new(adoption_status: "Available",
  name: "Blanca",
  species: "cat",
  breed: "European",
  sex: "female",
  age: "one year",
  colour: "white",
  description: "She is very purry and has a soft meow.
  She craves attention and loves to be stroked and to curl up against her human",
  outdoor_space: true,
  pet_friendly: "Yes",
  children_friendly: "Yes",
  hours_alone: 6,
  medical_conditions: "Good health condition"
  )

pet2.save!

puts "#{pet2.name} created.."

pet3 = Pet.new(adoption_status: "Available",
  name: "Laika",
  species: "dog",
  breed: "Border Collie",
  sex: "female",
  age: "9 years",
  colour: "black & white",
  description: "Intelligent and energetic dog despite the age. She loves walking",
  outdoor_space: true,
  pet_friendly: "Yes",
  children_friendly: "Yes",
  hours_alone: 6,
  medical_conditions: "Good health condition"
  )

pet3.save!

puts "#{pet3.name} created.."
