
puts 'Creating 10 fake users...'
10.times do
  user = User.create(
    email:    "#{Faker::Artist.name}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    first_name: "#{Faker::Artist.name}",
    last_name: "#{Faker::Artist.name}"
  )
end
puts 'Finished!'


puts 'Creating 10 fake lessons...'
10.times do
  lesson = Lesson.create(
    category:    ['Language', 'Science', 'Sport', 'Finance'].sample,
    name: Faker::Artist.name,
    description: "#{Faker::ChuckNorris.fact}",
    user_id: (1..10).to_a.sample
  )
end
puts 'Finished!'
