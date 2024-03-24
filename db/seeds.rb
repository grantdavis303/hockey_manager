# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# rails db:seed

print "Seeding"

Team.create!(
    name: "Colorado Avalanche",
    season_wins: 44,
    playoff_eligible: true
)

sleep(1)
print "."

Player.create!(
    team_id: 1,
    name: "Nathan MacKinnon",
    jersey_number: 29,
    won_cup: true
)

sleep(1)
print "."

Player.create!(
    team_id: 1,
    name: "Mikko Rantenen",
    jersey_number: 96,
    won_cup: true
)

sleep(1)
print "."

Player.create!(
    team_id: 1,
    name: "Casey Mittelstadt",
    jersey_number: 37,
    won_cup: false
)

sleep(1)
print "."

Team.create!(
    name: "Boston Bruins",
    season_wins: 41,
    playoff_eligible: true
)

sleep(1)
print "."

Player.create!(
    team_id: 2,
    name: "Brad Marchand",
    jersey_number: 63,
    won_cup: true
)

sleep(1)
print "."

Player.create!(
    team_id: 2,
    name: "Pat Maroon",
    jersey_number: 61,
    won_cup: true
)

sleep(1)
print "."

Player.create!(
    team_id: 2,
    name: "Morgan Geekie",
    jersey_number: 39,
    won_cup: false
)

sleep(1)
print "."

Team.create!(
    name: "Carolina Hurricanes",
    season_wins: 43,
    playoff_eligible: true
)

sleep(1)
print "."

Player.create!(
    team_id: 3,
    name: "Sebastian Aho",
    jersey_number: 20,
    won_cup: false
)

sleep(1)
print "."

Player.create!(
    team_id: 3,
    name: "Jordan Staal",
    jersey_number: 11,
    won_cup: true
)

sleep(1)
print "."

Player.create!(
    team_id: 3,
    name: "Brent Burns",
    jersey_number: 8,
    won_cup: false
)

sleep(1)
print "."

puts "Seeded Successfully."