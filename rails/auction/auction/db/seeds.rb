# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Product.destroy_all

puts "all is nothing"

5.times do |i|

	u = User.create(name: Faker::Company.name)
	x = u.name.split(" ")
	u.email = Faker::Internet.email(x[0])
	u.save 
	3.times do |i|
		p = Product.create(name: Faker::Team.creature)
		p.description = Faker::Lorem.sentence 
		p.deadline = Faker::Time.between(2.days.ago, Time.now, :all)
		p.save


	end

end
