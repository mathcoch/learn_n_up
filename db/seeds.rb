avatars = ['https://avatars2.githubusercontent.com/u/25741493?v=3',
 'https://avatars1.githubusercontent.com/u/25384564?v=3',
 'https://avatars2.githubusercontent.com/u/25634191?v=3',
 'https://avatars0.githubusercontent.com/u/26217119?v=3',
 'https://avatars1.githubusercontent.com/u/25386153?v=3',
 'https://avatars3.githubusercontent.com/u/26063436?v=3',
 'https://avatars2.githubusercontent.com/u/25520042?v=3',
 'https://avatars0.githubusercontent.com/u/25391939?v=3',
 'https://avatars0.githubusercontent.com/u/26824782?v=3',
 'https://avatars2.githubusercontent.com/u/22095643?v=3',
 'https://avatars2.githubusercontent.com/u/5082751?v=3',
 'https://avatars3.githubusercontent.com/u/25039335?v=3',
 'https://avatars0.githubusercontent.com/u/20208267?v=3',
 'https://avatars1.githubusercontent.com/u/25640383?v=3',
 'https://avatars0.githubusercontent.com/u/26192496?v=3',
 'https://avatars2.githubusercontent.com/u/26813947?v=3',
 'https://avatars3.githubusercontent.com/u/25387476?v=3',
 'https://avatars1.githubusercontent.com/u/26109494?v=3',
 'https://avatars2.githubusercontent.com/u/25432253?v=3',
 'https://avatars3.githubusercontent.com/u/25415107?v=3',
 'https://avatars0.githubusercontent.com/u/25386584?v=3',
 'https://avatars3.githubusercontent.com/u/26283143?v=3',
 'https://avatars3.githubusercontent.com/u/25386941?v=3',
 'https://avatars2.githubusercontent.com/u/25334439?v=3',
 'https://avatars0.githubusercontent.com/u/21340608?v=3',
 'https://avatars0.githubusercontent.com/u/26386903?v=3',
 'https://avatars2.githubusercontent.com/u/25476262?v=3',
 'https://avatars3.githubusercontent.com/u/25053116?v=3',
 'https://avatars3.githubusercontent.com/u/25897247?v=3',
 'https://avatars3.githubusercontent.com/u/25387973?v=3',
 'https://avatars1.githubusercontent.com/u/26443990?v=3',
 'https://avatars2.githubusercontent.com/u/22763571?v=3',
 'https://avatars1.githubusercontent.com/u/27200234?v=3',
 'https://avatars1.githubusercontent.com/u/15351435?v=3',
 'https://avatars3.githubusercontent.com/u/8135012?v=3',
 'https://avatars3.githubusercontent.com/u/15720142?v=3',
 'https://avatars2.githubusercontent.com/u/23017834?v=3',
 'https://avatars2.githubusercontent.com/u/22995692?v=3',
 'https://avatars3.githubusercontent.com/u/26142228?v=3',
 'https://avatars0.githubusercontent.com/u/25386031?v=3',
 'https://avatars0.githubusercontent.com/u/1410430?v=3']

courses = ['http://lorempixel.com/600/400/business/1',
 'http://lorempixel.com/600/400/business/2',
 'http://lorempixel.com/600/400/business/3',
 'http://lorempixel.com/600/400/business/4',
 'http://lorempixel.com/600/400/business/5',
 'http://lorempixel.com/600/400/business/6',
 'http://lorempixel.com/600/400/business/7',
 'http://lorempixel.com/600/400/business/8',
 'http://lorempixel.com/600/400/business/9',
 'http://lorempixel.com/600/400/business/10',]


puts 'Creating 10 fake users...'
10.times do
 user = User.create(
   email:    "#{Faker::Artist.name}@gmail.com",
   password: "123456",
   password_confirmation: "123456",
   first_name: "#{Faker::Artist.name}",
   last_name: "#{Faker::Artist.name}",
   img_url: avatars.sample
 )
end
puts 'Finished!'


puts 'Creating 10 fake lessons...'
10.times do
 lesson = Lesson.create(
   category:    ['Language', 'Science', 'Sport', 'Finance'].sample,
   name: Faker::Artist.name,
   description: "#{Faker::Educator.course}",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   days: ['1', '2', '4']
 )
end
puts 'Finished!'
