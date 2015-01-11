# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Room.create!(name: 'Blue', number: '1', number_of_toys: '0')
Room.create!(name: 'Green', number: '2', number_of_toys: '0')

Toy.create!(name: 'Dog', color: 'black', price: '99.99', available_num: '4', room: Room.first)
Toy.create!(name: 'Barbi', color: nil, price: '99.99', available_num: '5', room: Room.first)
Toy.create!(name: 'Car', color: 'red', price: '99.99', available_num: '6', room: Room.first)
Toy.create!(name: 'Elephant', color: nil, price: '99.99', available_num: '5', room: Room.first)
Toy.create!(name: 'Tiger', color: 'red', price: '99.99', available_num: '6', room: Room.first)

Toy.create!(name: 'Ball', color: 'green', price: '99.99', available_num: '3', room: Room.second)
Toy.create!(name: 'Bird', color: 'yellow', price: '99.99', available_num: '4', room: Room.second)
Toy.create!(name: 'Piano', color: 'white', price: '99.99', available_num: '4', room: Room.second)




