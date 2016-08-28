# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dilson = {
  first_name: "Dilson",
  last_name: "McCastro",
  email: "dilson.mccastro@flatironschool.com",
  username: "dilsonmccastro",
  password: "dilson123"
}

Lesson.delete_all
Lesson.create(name: "Rails Loops")
Lesson.create(name: "Rails Conditionals")

Track.delete_all
Track.create(name: "Web Development Immersive")

User.delete_all
user = User.create(dilson)
user.track = Track.all.first
