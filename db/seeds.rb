# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'D.Wilson@nhl.com', password: '1234567890', name: 'Doug Wilson')
League.create(name: 'NHL', sport: 'Hockey')
Team.create(city: 'San Jose', name: 'Sharks', coach: 'Bob Boughner', user_id: 1, league_id: 1)
Player.create(name: 'Logan Couture', number: 39, hometown: 'Ontario, Canada', team_id: 1)