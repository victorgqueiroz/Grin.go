# require 'pry-byebug'

  Trip.destroy_all # limpa o db
  User.destroy_all # limpa o db
  Place.destroy_all # limpa o db

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
    nacionality: "brazilian",
    host: Faker::Boolean.boolean,
    visitor: Faker::Boolean.boolean,
    password: "12345678"
  )
  # puts 'creating places'
  10.times do
    place = Place.create!(
      city: Faker::Address.city,
      country: Faker::Address.country,
      neighborhood: Faker::Address.community
      )
      # puts 'creating trip'

    # Cria a viagem associada ao usuário e ao lugar
    Trip.create!(
      user: user,
      place: place,
      review: Faker::Lorem.paragraph
      # Cria alguns locais para cada usuário
    )
  end
end
