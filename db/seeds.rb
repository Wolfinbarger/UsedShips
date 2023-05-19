# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
users = []
ships = []

Booking.destroy_all
Spaceship.destroy_all
User.destroy_all

User.create(name: 'Blork', email: 'Blork@empiremail.org', password: 'password123')
hypnotoad = User.create(name: 'Hypnotoad', email: 'Hypnotoad@hypnotoad.org', password: 'password')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs2NEBidSIu3A-UmIroMmuTYFm7Xf9tja_idcSNd6xVI16P6rEV2-WXNiX3n-yF-l8WNY&usqp=CAU')
hypnotoad.photo.attach(io: file, filename: 'hypnotoad.jpeg', content_type: 'image/jpeg')

dog = User.create(name: 'Dog', email: 'Dog@gmail.com', password: 'password')
file = URI.open('https://images.pexels.com/photos/4588001/pexels-photo-4588001.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
dog.photo.attach(io: file, filename: 'dog.jpeg', content_type: 'image/jpeg')

vader = User.create(name: 'Darth Vader', email: 'd.vader@empire.mail', password: 'order66')
file = URI.open('https://i0.wp.com/thelegalgeeks.com/wp-content/uploads/2017/05/Vader-Boards.jpg?fit=800%2C581&ssl=1')
vader.photo.attach(io: file, filename: 'lord_vader.jpeg', content_type: 'image/jpeg')

10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  users << user
end

caddy = Spaceship.new(name: 'Space Caddy', rate: rand(100), description: "That's no way to treat a Caddy", crew: 4, max_weight: 1, speed: 60, language: 'pIqaD-qolqoS' )
caddy.user = User.all.sample
caddy.save

planet_express = Spaceship.new(name: 'Planet Express', rate: 20, description: "The ship was designed and built by Professor Hubert J. Farnsworth and runs on dark matter, mostly supplied by Nibbler.", crew: 10, max_weight: 80, language: 'Galactic-Standard', speed: 5460)
planet_express.user = User.all.sample
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB2Bg1JZ7-aMXVsF_4yrwneCW8b0rTZmZ90Q&usqp=CAU')
planet_express.photo.attach(io: file, filename: 'planet-express.jpeg', content_type: 'image/jpeg')
planet_express.save

eagle = Spaceship.new(name: 'Eagle 5', rate: 2, description: 'Eagle 5 is the 1986 Winnebago Chieftain 33', crew: 2, max_weight: 11, features: 'TV in the cockpi, Periscope, Secret Hyperjets, Infared scanner', ship_model: 'Winnebago Chieftain 33', location: 'Space', speed: 3450)
eagle.user = User.all.sample
file = URI.open('https://static.wikia.nocookie.net/spaceballs/images/a/a6/Spaceballs-eagle5.jpg/revision/latest/scale-to-width-down/1200?cb=20181208022536')
eagle.photo.attach(io: file, filename: 'eagle4.jpeg',content_type: 'image/jpeg')
eagle.save

roc = Spaceship.new(name: 'Rocinante', rate: 1000, description: 'Former MCRN (Martian Congressional Republic Navy)-turned-independent Corvette-class frigate capable of multiple combat roles. Originally commissioned as the MCRN Tachi  (ECF-270)', crew: 6, armaments: '6x Nariman Dynamics 40mm Point Defense Cannons, 2x Torpedo launchers (each carrying 10 torpedoes for a total of 20)), keel-mounted railgun', size: 'Light Frigate', features: 'stealth', location: 'Sol System', max_weight: 1965, speed: 7560)
roc.user = User.all.sample
file = URI.open('https://qph.cf2.quoracdn.net/main-qimg-d9dd372c52bab050fe45b035ca4b2ffa-pjlq')
roc.photo.attach(io: file, filename: 'rocinante.jpeg', content_type: 'image/jpeg')
roc.save

enterprise = Spaceship.new(name: 'USS Enterprise', rate: 1340, armaments: 'Phaser banks 2x fore torpedo launchers 2x aft torpedo launchers', description: 'The USS Enterprise (NCC-1701) was a 23rd century Federation Constitution-class starship operated by Starfleet, and the first Federation starship to bear the name Enterprise. During its career, the Enterprise served as the Federation flagship and was in service from 2245 to 2285. During the latter years of its life, the Enterprise served as a training vessel until its destruction in 2285.', crew: 203, location: 'Wild Frontier', max_weight: 1_000_000, features: 'holographic rec room, chapel, holographic rec room', speed: 900_000_000)
enterprise.user = User.all.sample
file = URI.open('https://static.wikia.nocookie.net/memoryalpha/images/b/be/USS_Enterprise_%28NCC-1701%29%2C_ENT.jpg/revision/latest?cb=20171022133400&path-prefix=en')
enterprise.photo.attach(io: file, filename: 'enterprise.jpeg', content_type: 'image/jpeg')
enterprise.save

heighliner = Spaceship.new(name: 'Leto', rate: 10000, description: 'A starship used by the Spacing Guild to transport people and equipment across the known universe', crew: 450, max_weight: 40_000, speed: 50_000, language: 'Aurebesh')
heighliner.user = User.all.sample
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJbiro5yrnWqwK9rOMt1Z-QeV8jS8H3u7hIHFgzBfmDJA0bf1DteGQ1vrvlqhpsLU2S7Q&usqp=CAU')
heighliner.photo.attach(io: file, filename: 'dune_heighliner.jpeg', content_type: 'image/jpeg')
heighliner.save

7.times do
  booking = Booking.new(status: rand(0..2), start_date: (Date.today + rand(-5..5)))
  booking.end_date = Date.today + rand((Date.today - booking.start_date)..10)
  booking.spaceship_id = Spaceship.all.sample.id
  booking.user_id = User.all.sample
  booking.total_price = (booking.start_date - booking.end_date) * Spaceship.find(booking.spaceship_id).rate
  booking.save
end

5.times do
  review = SpaceshipReview.new(comment: Faker::Restaurant.review)
  review.spaceship_id = Spaceship.all.sample.id
  review.user_id = User.all.sample
  review.save
end
