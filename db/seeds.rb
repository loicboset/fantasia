# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Character.destroy_all if Rails.env.development?

10.times do
  Character.create(
    name: Faker::Games::Pokemon.name,
    description: "Lorem ipsum Lorem ipsum Lorem ipsum",
    address: Faker::Address.full_address,
    image_url: "https://images.unsplash.com/photo-1596525728348-7b13f6e6d7a0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
    price_per_day: rand(10..400),
    user_id: 1
  )
end
