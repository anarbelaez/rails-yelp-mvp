# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

categories = %w[chinese italian japanese french belgian]

puts 'Creating restaurants'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: categories.sample
  )
  restaurant.save!
end
puts 'Restaurants created successfully!'

puts 'Adding reviews'
Restaurant.all.each do |restaurant|
  rand(1..3).times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(6),
      restaurant_id: restaurant.id
    )
    review.save!
  end
end
puts 'Reviews added successfully!'
