# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning user database..."
User.destroy_all

puts "Cleaning shelter database..."
Shelter.destroy_all

puts "Cleaning pets database"
Pet.detroy_all

puts "creating user who is a shelter... "

mainuser = User.create!(email: "shelter2022@gmail.com", password: "shelter2022", first_name: "Cat", last_name: "Dog", age: 30, shelter: true, biography: "A shelter in Shoreditch looking to use Happy tails.", type_of_dwelling: "a shop", outdoor_space: true, other_pets: "yes i have plenty", children: "none", hours_alone: 1, previous_experience: "yes spent 10 years working with pets")
mainuser.save!

puts "user shelter created.."


puts "creating shelter"

mainshelter = Shelter.new( name: "Shoreditch Shelter",
                           address: "Shoreditch Stables, North, 138 Kingsland Rd, London E2 8DY ",
                           user: User.first)
mainshelter.save!
