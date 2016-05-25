# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user1 = User.create!(username: "Fiorina", password_digest: "123456")
user2 = User.create!(username: "Trump", password_digest: "123456")
user3 = User.create!(username: "Carson", password_digest: "123456")
user4 = User.create!(username: "Clinton", password_digest: "123456")

profile1 = Profile.create!(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina", user_id: user1.id)
profile2 = Profile.create!(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump", user_id: user2.id)
profile3 = Profile.create!(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson", user_id: user3.id)
profile4 = Profile.create!(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton", user_id: user4.id)

User.all.each do |user|
	user.todo_lists.create!(list_name: "#{user.username}'s Todo List", list_due_date: 1.year.from_now)
end

TodoList.all.each do |list|
	5.times do |i|
		list.todo_items.create!(due_date: 1.year.from_now, title: "Item #{i + 1}", description: "Description #{i + 1}", completed: false)
	end
end
