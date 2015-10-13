Concert.destroy_all
puts "concerts destroyed"


35.times do |i|

	c =	Concert.new(band: Faker::Commerce.product_name.upcase)
	c.venue = Faker::Address.street_name
	c.city = Faker::Address.city
	c.datetime = Faker::Date.forward(23)
	c.price = Faker::Commerce.price
	c.description = Faker::Lorem.paragraph
	c.save
end







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
