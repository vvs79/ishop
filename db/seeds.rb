# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(login: 'admin', first_name: 'Admin', last_name: 'Admin', email: 'a@a.com', password: '87654321', admin: true)
User.create!(login: 'user', first_name: 'User', last_name: 'User', email: 'u@u.com', password: '12345678', admin: false)

25.times do |_|
  name = Faker::Name.title
  price = Faker::Number.between(1, 10000)
  description = Faker::Name.title + Faker::Name.title + Faker::Name.title + Faker::Name.title + Faker::Name.title
  user_id = 1
  Item.create!(name: name, price: price, description: description, user_id: user_id)
end
