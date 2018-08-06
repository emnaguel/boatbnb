# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_one = User.create(email: "julie@gmail.com", password: "1234567")
user_two = User.create(email: "marie@gmail.com", password: "1234567")
user_three = User.create(email: "jerome@gmail.com", password: "1234567")

boat_three = Boat.new(name: "God of the Sea", address: "Saint-Tropez")
boat_three.owner = User.find_by(email: "julie@gmail.com")
boat_three.save!

boat_five = Boat.new(name: "Zephyr", address: "Saint-Tropez")
boat_five.owner = User.find_by(email: "marie@gmail.com")
boat_five.save!

boat_six = Boat.new(name: "Notus", address: "Sidi-Bou")
boat_six.owner = User.find_by(email: "jerome@gmail.com")
boat_six.save!
