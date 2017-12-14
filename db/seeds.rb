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
