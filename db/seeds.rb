# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning the DB"

Medication.destroy_all
User.destroy_all

puts "Creating new docdoggie user"

user1 = User.create(email: "johndoe@anonymous.com", password: "666666")

puts "Generating user medication"

Medication.create(name: "qualquercoisa", dosage: 100, hours: "08:00", taken: false, purpose: "menosmal", user_id: user1.id)
Medication.create(name: "maiscoisa", dosage: 50, hours: "13:30", taken: false, purpose: "menosmal", user_id: user1.id)
Medication.create(name: "aindamaiscoisa", dosage: 50, hours: "20:00", taken: false, purpose: "menosmal", user_id: user1.id)

puts "Finished"
