# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do |i|

	p =	Contact.new(name: Faker::Company.name)
	x = p.name.split(" ")
	p.address = Faker::Address.street_address
	p.phone_number = Faker::Address.building_number.to_i
	p.email = Faker::Internet.email(x[0])
	p.save
end

