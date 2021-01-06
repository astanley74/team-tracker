# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'D.Wilson@nhl.com', password: '1234567890', name: 'Doug Wilson')
League.create(name: 'NHL', sport: 'Hockey')
League.create(name: 'NBA', sport: 'Basketball')
League.create(name: 'MLB', sport: 'Baseball')
League.create(name: 'MLS', sport: 'Soccer')
League.create(name: 'NFL', sport: 'Football')
League.create(name: 'NASCAR', sport: "Racing")

Team.create(city: 'San Jose', name: 'Sharks', coach: 'Bob Boughner', user_id: 1, league_id: 1)
Player.create(name: 'Logan Couture', number: 39, hometown: 'Ontario, Canada', team_id: 1)
Player.create(name: 'Erik Karlsson', number: 65, hometown: 'Landsbro, Sweden', team_id: 1)
Player.create(name: 'Brent Burns', number: 88, hometown: 'Ontario, Canada', team_id: 1)
Player.create(name: 'Timo Meier', number: 28, hometown: 'Herisau, Switzerland', team_id: 1)

Team.create(city: 'San Francisco', name: '49ers', coach: 'Kyle Shanahan', user_id: 1, league_id: 5)
Player.create(name: 'Jimmy Garoppolo', number: 10, hometown: 'Arlington Heights, Illinois', team_id: 2)
Player.create(name: 'George Kittle', number: 85, hometown: 'Madison, Wisconsin', team_id: 2)
Player.create(name: 'Nick Bosa', number: 97, hometown: 'Fort Lauderdale, Florida', team_id: 2)
Player.create(name: 'Raheem Mostert', number: 31, hometown: 'New Smyrna Beach, Florida', team_id: 2)

Team.create(city: 'Golden State', name: 'Warriors', coach: 'Steve Kerr', user_id: 1, league_id: 2)
Player.create(name: 'Stephen Curry', number: 30, hometown: 'Charlotte, North Carolina', team_id: 3)
Player.create(name: 'Klay Thompson', number: 11, hometown: 'Los Angeles, California', team_id: 3)
Player.create(name: 'Draymond Green', number: 32, hometown: 'Saginaw, Michigan', team_id: 3)
Player.create(name: 'James Wiseman', number: 33, hometown: 'Nashville, Tennessee', team_id: 3)

Team.create(city: 'Oakland', name: 'Athletics', coach: 'Bob Melvin', user_id: 1, league_id: 3)
Player.create(name: 'Matt Chapman', number: 26, hometown: 'Trabuco Canyon, California', team_id: 4)
Player.create(name: 'Matt Olson', number: 28, hometown: 'Atlanta, Georgia', team_id: 4)
Player.create(name: 'Khris Davis', number: 2, hometown: 'Lakewood, California', team_id: 4)
Player.create(name: 'Stephen Piscotty', number: 25, hometown: 'Pleasanton, California', team_id: 4)

Team.create(city: 'San Jose', name: 'Earthquakes', coach: 'Matías Almeyda', user_id: 1, league_id: 4)
Player.create(name: 'Cade Cowell', number: 44, hometown: 'Ceres, California', team_id: 5)
Player.create(name: 'Carlos Fierro', number: 21, hometown: 'Ahome, Sinaloa', team_id: 5)
Player.create(name: 'Chris Wondolowski', number: 8, hometown: 'Danville, California', team_id: 5)
Player.create(name: 'JT Marcinkowski', number: 18, hometown: 'Alamo, California', team_id: 5)