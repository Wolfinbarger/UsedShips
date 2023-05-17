# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = []
ships = []

Spaceship.destroy_all
Booking.destroy_all
User.destroy_all

10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
  users << user
end

10.times do
  ship = Spaceship.new(name: Faker::TvShows::TheExpanse.ship, rate: rand(100), description: Faker::TvShows::TheExpanse.quote, crew: rand(1..100), max_weight: rand(100..1000))
  ship.user = User.all.sample
  ship.save
  ships << ship
end
