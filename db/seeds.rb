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



Track.delete_all
track1 = Track.create(name: "Web Development Immersive")

User.delete_all
user = User.create(dilson)
user.track = track1

Lesson.delete_all
lesson1 = Lesson.create(name: "Rails Loops", content: "Show how to loop over an array and print each number inside")
lesson1.track = track1
lesson1.save
lesson2 = Lesson.create(name: "Rails Conditionals", content: "Show how to use 'if', 'and', and 'else'")
lesson2.track = track1
lesson2.save
lesson3 = Lesson.create(name: "Rails Generations", content: "Don't use scaffold")
lesson3.track = track1
lesson3.save
lesson4 = Lesson.create(name: "Basic Syntax", content: "Show how to build a hash with 5 items")
lesson4.track = track1
lesson4.save
lesson5 = Lesson.create(name: "Rails Methods", content: "Build a simple method which takes in an argument of name and prints out that name")
lesson5.track = track1
lesson5.save
