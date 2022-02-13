# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating creator 🤖'
creator = User.create!(email: 'creator@admin.com', password: 'strong_password')

puts 'Creating categories 💬'
ruby_category = Category.create!(title: 'Ruby')
java_category = Category.create!(title: 'Java')

puts 'Creating tests 🗒️'
ruby_basics = Test.create!(title: 'Ruby Basics', level: 1, category_id: ruby_category.id, author: creator)
ruby_professional = Test.create!(title: 'Ruby for professional development', level: 4, category_id: ruby_category.id, author: creator)
java_beginner = Test.create!(title: 'Java Beginner', level: 2, category_id: java_category.id, author: creator)

puts 'Creating questions ❓'
ruby_basics_question1 = Question.create!(body: 'What is var?', test_id: ruby_basics.id)
ruby_basics_question2 = Question.create!(body: 'What is class?', test_id: ruby_basics.id)
ruby_basics_question3 = Question.create!(body: 'What is object?', test_id: ruby_basics.id)

ruby_professional_question1 = Question.create!(body: 'How are the arguments in ruby passed?',
                                               test_id: ruby_professional.id)
ruby_professional_question2 = Question.create!(body: 'Name the tools that you would use for debugging',
                                               test_id: ruby_professional.id)
ruby_professional_question3 = Question.create!(body: 'Does not ruby use real threads?',
                                               test_id: ruby_professional.id)

java_beginner_question1 = Question.create!(body: 'Difference between ArrayList and HashSet in Java?',
                                           test_id: java_beginner.id)
java_beginner_question2 = Question.create!(body: 'Can we override the private method in Java?',
                                           test_id: java_beginner.id)
java_beginner_question3 = Question.create!(body: 'Difference between List and Set in Java?',
                                           test_id: java_beginner.id)

puts 'Creating answers 🔠'
puts 'For Ruby Basics Test ⚫'
Answer.create!(body: 'Variables are used to store information to be referenced and manipulated in a computer program',
               correct: true,
               question_id: ruby_basics_question1.id)
Answer.create!(body: 'Video assistant referee', question_id: ruby_basics_question1.id)
Answer.create!(body: 'Class method', question_id: ruby_basics_question1.id)

Answer.create!(body: 'Class describes the contents of the objects that belong to it',
               correct: true,
               question_id: ruby_basics_question2.id)
Answer.create!(body: 'School class', question_id: ruby_basics_question2.id)
Answer.create!(body: 'One of the OOP principles', question_id: ruby_basics_question2.id)

Answer.create!(body: 'Instance of class', correct: true, question_id: ruby_basics_question3.id)
Answer.create!(body: 'Subject in the real life', question_id: ruby_basics_question3.id)
Answer.create!(body: 'One of the OOP principles', question_id: ruby_basics_question3.id)

puts 'For Ruby Professional Test ⚫'
Answer.create!(body: 'By object_id', correct: true, question_id: ruby_professional_question1.id)
Answer.create!(body: 'By reference', question_id: ruby_professional_question1.id)
Answer.create!(body: 'By value', question_id: ruby_professional_question1.id)

Answer.create!(body: 'Byebug and Pry', correct: true, question_id: ruby_professional_question2.id)
Answer.create!(body: 'Sentry', question_id: ruby_professional_question2.id)
Answer.create!(body: 'Bug reports by users', question_id: ruby_professional_question2.id)

Answer.create!(body: 'No, it is possible works only in one thread', question_id: ruby_professional_question3.id)
Answer.create!(body: 'It is possible with MRI, for example', correct: true, question_id: ruby_professional_question3.id)
Answer.create!(body: 'Ruby by default have multithreading', question_id: ruby_professional_question3.id)

puts 'For Java Beginner Test ⚫'
Answer.create!(body: 'ArrayList is List implementation, HashSet is a Set implementation',
               correct: true,
               question_id: java_beginner_question1.id)
Answer.create!(body: 'Is the same things', question_id: java_beginner_question1.id)
Answer.create!(body: 'ArrayList is array, HashSet is hash', question_id: java_beginner_question1.id)

Answer.create!(body: 'Yes, we can', question_id: java_beginner_question2.id)
Answer.create!(body: 'No, we can\'t', correct: true, question_id: java_beginner_question2.id)
Answer.create!(body: 'Sometimes yes, sometimes no', question_id: java_beginner_question2.id)

Answer.create!(body: 'List allows duplicate, Set doesn\'t', correct: true, question_id: java_beginner_question3.id)
Answer.create!(body: 'Is the same things', question_id: java_beginner_question3.id)
Answer.create!(body: 'List can\'t be used in private methods, but Set - can', question_id: java_beginner_question3.id)

puts 'Creating users 👤'
newbie_user = User.create!(email: 'TheNewbie123@test.com', password: 'strong_password')
pro_user = User.create!(email: 'Senior_Dev@test.com', password: 'strong_password')

puts 'Seeding is done ✅'
