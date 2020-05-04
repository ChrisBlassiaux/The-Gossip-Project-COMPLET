# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
JoinTableTagGossip.destroy_all

10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Number.between(from: 40000, to: 50000)
  )
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10),
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 16, to: 60),
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

20.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 1),
    content: Faker::Lorem.sentence(word_count: 10),
    user_id: User.find(rand(User.first.id..User.last.id)).id
  )
end

10.times do
  Tag.create!(
    title: Faker::Lorem.sentence(word_count: 1)
  )
end

20.times do
  JoinTableTagGossip.create!(
    gossip_id: Gossip.find(rand(Gossip.first.id..Gossip.last.id)).id,
    tag_id: Tag.find(rand(Tag.first.id..Tag.last.id)).id
  )  
end

5.times do
  PrivateMessage.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    sender_id: User.find(rand(User.first.id..User.last.id)).id,
    recipient_id: User.find(rand(User.first.id..User.last.id)).id
  )
end