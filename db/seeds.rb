# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

harry    = User.create!(name: "Harry Potter", 
             email: "harry.potter@hogwarts.edu", 
             password: "password", 
             password_confirmation: "password",
             admin: true)
draco    = User.create!(name: "Draco Malfoy", 
             email: "draco.malfoy@hogwarts.edu", 
             password: "password", 
             password_confirmation: "password")
hermione = User.create!(name: "Hermione Granger", 
             email: "hermoine.granger@hogwarts.edu", 
             password: "password", 
             password_confirmation: "password")
ron      = User.create!(name: "Ron Weasley", 
             email: "ronald.weasley@hogwarts.edu", 
             password: "password", 
             password_confirmation: "password")


skiing = Hobby.create!(name: "Skiing", 
              description: "Wear chopsticks on your feet and go down a snowy mountain")
Hobby.create!(name: "Programming", 
              description: "Become the ultimate neckbeard!" )
Hobby.create!(name: "Skateboarding", 
              description: "Kickflips and pop-shove its")
Hobby.create!(name: "Cooking", 
              description: "IT'S FUCKING RAW")

Post.create!(user_id: harry.id, hobby_id: skiing.id, title: "Urban Skiing", content: "Urban skiing in Nelson, British Columbia", link: "https://www.youtube.com/watch?v=ua26CixwnKs")