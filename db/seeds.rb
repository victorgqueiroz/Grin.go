# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "123123")

require 'faker'
# require 'pry-byebug'

  # Trip.destroy_all # limpa o db
  # User.destroy_all # limpa o db
  # Place.destroy_all # limpa o db

6.times do
  # binding.pry
  # puts 'creating users'
  random_country = Faker::Address.country
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    address: Faker::Address.full_address,
    language: Faker::Lorem.word,
    city: Faker::Address.city,
    age: Faker::Number.between(from: 18, to: 80),
    occupation: Faker::Job.title,
    interests: Faker::Lorem.words(number: 3).join(', '),
    about: Faker::Lorem.paragraph,
    classification: Faker::Number.between(from: 1, to: 5),
    visited_places: random_country,
    host: Faker::Boolean.boolean,
    visitor: Faker::Boolean.boolean,
    password: rand
  )
  # puts 'creating places'

  place = Place.create!(
    cities: Faker::Address.city,
    countries: Faker::Address.country,
    neighborhood: Faker::Address.community
    )
    # puts 'creating trip'

  # Cria a viagem associada ao usuário e ao lugar
  Trip.create(
    user: user,
    place: place,
    review: Faker::Lorem.paragraph
    # Cria alguns locais para cada usuário
  )
end
