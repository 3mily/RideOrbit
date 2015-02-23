# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
me = User.new(firstname: 'me',lastname:'you',phone:'555-5555',password:'pw',email:'me@you') 

place1 = Place.new(user_id:1, cross_street:"x st")

