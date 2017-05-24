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

courses = ['http://lorempixel.com/1600/1000/business/1',
 'http://lorempixel.com/1600/1000/business/2',
 'http://lorempixel.com/1600/1000/business/3',
 'http://lorempixel.com/1600/1000/business/4',
 'http://lorempixel.com/1600/1000/business/5',
 'http://lorempixel.com/1600/1000/business/6',
 'http://lorempixel.com/1600/1000/business/7',
 'http://lorempixel.com/1600/1000/business/8',
 'http://lorempixel.com/1600/1000/business/9',
 'http://lorempixel.com/1600/1000/business/10',]


puts 'Creating 10 fake users...'

user = User.create(
   email:    "learnup@gmail.com",
   password: "123456",
   password_confirmation: "123456",
   first_name: "Tom",
   last_name: "Sawyer",
   img_url: avatars.sample
 )

9.times do
 user = User.create(
   email:    "#{Faker::Name.last_name}@gmail.com",
   password: "123456",
   password_confirmation: "123456",
   first_name: "#{Faker::Name.first_name}",
   last_name: "#{Faker::Name.last_name}",
   img_url: avatars.sample
 )
end
puts 'Finished!'


puts 'Creating 10 fake lessons...'
# 10.times do
#  lesson = Lesson.create(
#    category:    ['Language', 'Science', 'Sport', 'Finance'].sample,
#    name: Faker::Artist.name,
#    description: "#{Faker::Educator.course}",
#    user_id: (1..10).to_a.sample,
#    img_url: courses.sample,
#    level:['Beginner', 'Advanced', 'Pro'].sample,
#    duration: rand(0..8),
#    address: "#{Faker::Address.street_address}",
#    city: "#{Faker::Address.city}"
#  )
# end

lesson = Lesson.create(
   category:    'Language',
   name: "Learn mandarin basics",
   description: "Introductory Mandarin is the first in a series of six courses designed to teach you how to speak Mandarin Chinese. This course will introduce you to the basic language you will need to eat, live, and get around in Mandarin speaking countries.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","05/28/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 2)

lesson = Lesson.create(
   category:    'Science',
   name: "Climate Change",
   description: "Do you want to talk about climate change from an informed perspective? Are you interested in how global warming works? Climate change is the biggest challenge of our time, and climate science is critical to finding solutions. How can we make the best decisions about our present and future? By taking this course, you can be part of the global conversation.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 3)

lesson = Lesson.create(
   category:    'Language',
   name: "Conversational English Skills",
   description: "Are you finding it difficult to start the conversation, or find the right words when communicating in English? Do you know how to start and end conversations in a polite way? Do it through this 4h course.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 2)

lesson = Lesson.create(
   category:    'Sport',
   name: "Ethics of Sports",
   description: "While sport sometimes is dismissed as frivolous, it not only raises fundamental ethical questions, such as what counts as fair play, but is an important cultural phenomenon attracting the interests of millions of people around the globe. Love sports or hate them, their cultural role or influence cannot easily be dismissed.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 6)

lesson = Lesson.create(
   category:    'Science',
   name: "Data Science Orientation",
   description: "This is the first stop in the Data Science curriculum from Microsoft. It will help you get started with the program, plan your learning schedule, and connect with fellow students and teaching assistants.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 3)


lesson = Lesson.create(
   category:    'Finance',
   name: "Personal Finance",
   description: "Want to better understand investments? How credit works? How and why insurance products like life insurance, health insurance, and property insurance might be relevant for you? How to maximize your retirement savings? This course aims to make finding the answers to these questions, and many other similar questions, interesting and fun.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 7)

lesson = Lesson.create(
   category:    'Language',
   name: "French theatre",
   description: "Le théâtre classique du 17e siècle passe pour le sommet de l’art du théâtre en France. Ses trois représentants les plus connus, Corneille et Racine pour la tragédie et Molière pour la comédie comptent parmi les plus grands dramaturges européens de tous les temps, et Molière reste l’un des auteurs les plus joués dans le monde.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 2)

lesson = Lesson.create(
   category:    'Finance',
   name: "How to become a billionnaire?",
   description: "Are you involved in the development and execution of technical projects and eager to know what it takes to fund a project successfully? Would you like to be more in touch with the latest developments in project finance and able to use these to your advantage? If so, you’re in the right place!",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 7)

lesson = Lesson.create(
   category:    'Sport',
   name: "Math in Sports",
   description: "In this course you will learn to use some mathematical tools that can help predict and analyze sporting performances and outcomes. This course will help coaches, players, and enthusiasts to make educated decisions about strategy, training, and execution.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 6)

lesson = Lesson.create(
   category:    'Science',
   name: "How to raise your kid?",
   description: "Developmental psychology is the study of an individual’s social, emotional, cognitive, and biological development through his or her lifespan. The focus of this course will be from infancy to later life.",
   user_id: (1..10).to_a.sample,
   img_url: courses.sample,
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 3)

lesson = Lesson.create(
   category:    'Language',
   name: "Romanian theatre",
   description: "A deep dive in Romian culture - Romian are not only thief !",
   user_id: (1..10).to_a.sample,
   img_url: 'https://avatars1.githubusercontent.com/u/25384564?v=3',
   level:['Beginner', 'Advanced', 'Pro'].sample,
   duration: rand(0..8),
   address: "#{Faker::Address.street_address}",
   city: "#{Faker::Address.city}",
   dates: ["05/25/2017","05/26/2017","05/27/2017","06/01/2017","06/02/2017","06/03/2017"],
   category_number: 2)

puts 'Finished!'
