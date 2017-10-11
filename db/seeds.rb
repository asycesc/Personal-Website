User.create!(
	email: "admin@test.com",
	name: "admin",
	password: "1234",
	password_confirmation: "1234",
	roles: "website_admin"
)

puts "1 admin user created"

User.create!(
	email: "guest@test.com",
	name: "guest",
	password: "1234",
	password_confirmation: "1234",
)

puts "1 guest user created"

3.times do |topic|
	Topic.create!(
		title:"##{topic} fake topic"
	)
end

puts "3 topics created"

10.times do |blog|
	Blog.create!(
		title: "##{blog} fake blog",
		body: "fake blog content",
		topic_id: Topic.last.id
	)
end
puts "10 blogs created"

5.times do |skill|
	Skill.create!(
		title: "##{skill} fake skill",
		percentage: 20
	)
end
puts "5 skills created"

8.times do |portfolio|
	Portfolio.create!(
		title: "##{portfolio} fake portfolio",
			subtitle: "fake subtitle",
		body: "fake content",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end

1.times do |portfolio|
	Portfolio.create!(
		title: "#{portfolio} portfolio",
			subtitle: "Angular",
		body: "fake content",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end

puts "9 portfolio created"


3.times do |technology|
	Portfolio.last.technologies.create!(
		name: "##{technology} fake tech"
	)
end

puts "3 technologies created"