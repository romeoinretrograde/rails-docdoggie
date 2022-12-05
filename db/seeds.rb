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
Doggie.destroy_all
User.destroy_all

puts "Creating new docdoggie user"
user1 = User.create(email: "johndoe@anonymous.com", password: "666666")

puts "Creating doggie"
doggie1 = Doggie.create(user: user1, image_url: "doggies/brown-docdoggie.png", petname: "Sir Chuckles")


puts "Generating user medication"
med1 = Medication.create(name: "Mirtazapine", dosage: 100, hours: "08:00", taken: false, purpose: "antidepressant", user_id: user1.id, weekdays: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"])
med2 = Medication.create(name: "Temazepam", dosage: 15, hours: "13:30", taken: false, purpose: "insomnia", user_id: user1.id, weekdays: ["Sunday"])
med3 = Medication.create(name: "Pyridoxine", dosage: 50, hours: "20:00", taken: false, purpose: "vitamin B6", user_id: user1.id, weekdays: ["Monday", "Wednesday", "Friday"])

puts "Finished"
