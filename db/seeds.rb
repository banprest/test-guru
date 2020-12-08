# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'banpresto')
user1 = User.create(username: 'banpresto1')

category = Category.create(title: 'Frontend')
category1 = Category.create(title: 'Backend')

test1 = Test.create(title: 'Ruby', level: 2, category_id: category1.id)
test2 = Test.create(title: 'HTML', level: 1, category_id: category.id)
test3 = Test.create(title: 'CSS', level: 1, category_id: category.id)

question = Question.create(body: 'who?', test_id: test1.id)
Answer.create(variant: '?', question_id: question.id)
Answer.create(correct: true, variant: '??', question_id: question.id)

question1 = Question.create(body: 'why?', test_id: test2.id)
Answer.create(variant: '??', question_id: question1.id)
Answer.create(correct: true, variant: '!', question_id: question1.id)

UserInfo.create(test_id: test1.id, user_id: user.id)
UserInfo.create(test_id: test2.id, user_id: user.id)
UserInfo.create(test_id: test3.id, user_id: user.id)