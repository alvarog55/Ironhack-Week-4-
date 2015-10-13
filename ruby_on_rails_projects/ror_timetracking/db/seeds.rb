# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
Entry.destroy_all
User.destroy_all

puts "all is nothing"

user1= User.create(username: Faker::Name.name)
user2 = User.create(username: Faker::Name.name)
user3 =User.create(username: Faker::Name.name)
users = [user1, user2, user3]

5.times do |i|

	p = Project.create(title: Faker::Company.name)
	p.description = Faker::Hacker.say_something_smart
	p.save 


	3.times do |i|
		random_user = users.sample
		e = p.entries.new
		e.minutes = Faker::Number.between(1, 60)
		e.user_id = random_user.id
		e.hours = Faker::Number.between(1, 24)
		e.comment = Faker::Team.creature
		e.start_date = Faker::Time.between(2.days.ago, Time.now, :all)
		e.save


	end
end
