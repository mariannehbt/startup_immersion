# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '*' * 60
puts 'Seeds'
puts '*' * 60


puts ''

puts '*' * 60
puts 'Creating 10 Users'
puts '*' * 60

10.times do
	User.create!(
		email: Faker::Name.first_name + '.' + Faker::Name.last_name + '@yopmail.com',
		password: 'coucou',
		)
end

puts ''

puts '*' * 60
puts 'End of Seeds'
puts '*' * 60
