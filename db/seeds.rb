require 'faker'

puts "Seeding data... "


#create 10 random users
10.times do
	User.create!(
		username: Faker::Name.first_name,
		email: Fastaker::Internet.email,
		password: Faker::Internet.password
	)

	#For each user create 10 random notes
	10.times do 
		Note.create!(
			title: Faker::Book.title,
			description: Faker::Lorem.paragrapth(sentence_count: 2),
			user_id: Faker::Number.between(from: 1, to:5)
		)
	end
end

# 10.times do 
# 	Note.create!(
# 		title: Faker::Book.title,
# 		description: Faker::Lorem.paragrapth(sentence_count: 2)
# 		user_id: Faker::Number.between(from: 1, to:5)
# 	)
# end

