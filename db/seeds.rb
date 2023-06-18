  # require 'pry-byebug'
  require "city-state"

  # Trip.destroy_all # limpa o db
  # User.destroy_all # limpa o db
  # Place.destroy_all # limpa o db
  # Message.destroy_all

6.times do
  # puts 'creating users'
  # debugger
  random_country = CS.countries.to_a.sample
  states = CS.states(random_country.first.downcase).to_a.sample
  city = CS.cities(states.first.downcase, random_country.first.downcase).first

  place = Place.new(
    city: city,
    country: random_country.last,
    neighborhood: Faker::Address.community
    )
    20.times do
      user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      address: Faker::Address.full_address,
      language: Faker::Lorem.word,
      age: Faker::Number.between(from: 18, to: 80),
      city: city,
      occupation: Faker::Job.title,
      interests: Faker::Lorem.words(number: 3).join(', '),
      about: Faker::Lorem.paragraph,
      classification: Faker::Number.between(from: 1, to: 5),
      nacionality: Faker::Nation.nationality,
      host: Faker::Boolean.boolean,
      visitor: Faker::Boolean.boolean,
      password: "12345678",
      place: place
    )
    # puts 'creating places'
    10.times do
      Trip.create!(
        user: user,
        place: place,
        legend: Faker::Lorem.paragraph
        # Cria alguns locais para cada usuário
      )
      # puts 'creating trip'

      # Cria a viagem associada ao usuário e ao lugar
      end
    end
  end
