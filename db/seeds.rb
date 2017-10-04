10.times do |blog|
  Blog.create!(
    title: "#{blog} blog post",
    body: "snajn hluihuih ndakjwnbwhql j;qjinjbqkbn2bm "
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

9.times do |portfolio|
  Portfolio.create!(
  	title: "#{portfolio} title",
      subtitle: "#{portfolio} subtitle",
  	body: "asddasdasdas",
  	main_image: "http://via.placeholder.com/600x400",
  	thumb_image: "http://via.placeholder.com/300x200"
  )
end

puts "9 portfolio created"