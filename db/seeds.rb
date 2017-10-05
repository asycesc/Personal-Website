3.times do |topic|
  Topic.create!(
    title:"#{topic}'s topic"
  )
end

puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "#{blog} blog post",
    body: "snajn hluihuih ndakjwnbwhql j;qjinjbqkbn2bm ",
    topic_id: Topic.last.id
  )
end
puts "10 blogs created"

5.times do |skill|
  Skill.create!(
  	title: "#{skill}",
    percentage: 15
  )
end
puts "5 skills created"

8.times do |portfolio|
  Portfolio.create!(
  	title: "#{portfolio} title",
      subtitle: "Ruby On Rails",
  	body: "asddasdasdas",
  	main_image: "http://via.placeholder.com/600x400",
  	thumb_image: "http://via.placeholder.com/350x200"
  )
end

1.times do |portfolio|
  Portfolio.create!(
    title: "#{portfolio} title",
      subtitle: "Angular",
    body: "asddasdasdas",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "9 portfolio created"


3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"