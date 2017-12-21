# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

test_parent = Parent.create(
  email: 'testparent@test.com',
  password: '123456'
)

test_sitter = Sitter.create(
  email: 'testsitter@test.com',
  password: '123456'
)

babysitting_time = Gig.create(
  name: "Date Night"
  start_time: Time.now + 1.hours,
  end_time: Time.now + 3.hours,
  description: "we're going to dinner and a movie, order whatever you want for you and the kids and call me if you need anything!"
  cost: 15,
  parent_id: test_parent.id,
  sitter_id: test_sitter.id
)

babysitting_time_2 = Gig.create(
  name: "Concert"
  start_time: Time.now + 25.hours,
  end_time: Time.now + 27.hours,
  description: 'going to see a show, be back around 11pm, tuck them in around 9 please!'
  cost: 15,
  parent_id: test_parent.id,
  sitter_id: test_sitter.id
)

babysitting_time_3 = Gig.create(
  name: "Errands"
  start_time: Time.now + 25.hours,
  end_time: Time.now + 27.hours,
  description: "need to run some errands, shouldn't be longer than 2 hours but if I am I'll pay you for the extra time when I'm back."
  cost: 15,
  parent_id: test_parent.id,
  sitter_id: test_sitter.id
)

10.times do
  sitter = Sitter.create(
    email: Faker::Internet.email,
    password: '123456'
  )
end

10.times do
  parent = Parent.create(
    email: Faker::Internet.email,
    password: '123456'
  )
end
