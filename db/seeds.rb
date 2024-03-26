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
# rails db:{drop,create,migrate,seed}

puts "Seeding"

print "Creating Teams"

    Team.create!(name: "Colorado Avalanche", season_wins: 46, playoff_eligible: true)
    sleep(0.5)
    print "."

    Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
    sleep(0.5)
    print "."

    Team.create!(name: "Carolina Hurricanes", season_wins: 45, playoff_eligible: true)
    sleep(0.5)
    print "."

    Team.create!(name: "San Jose Sharks", season_wins: 16, playoff_eligible: false)
    sleep(0.5)
    print "."

    Team.create!(name: "Chicago Blackhawks", season_wins: 20, playoff_eligible: false)
    sleep(0.5)
    print "."

    Team.create!(name: "Anaheim Ducks", season_wins: 24, playoff_eligible: false)
    sleep(0.5)
    print "."

puts " "

print "Creating Players"

    Player.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 1, name: "Mikko Rantenen", jersey_number: 96, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 1, name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 2, name: "Brad Marchand", jersey_number: 63, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 2, name: "Pat Maroon", jersey_number: 61, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 2, name: "Morgan Geekie", jersey_number: 39, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 3, name: "Sebastian Aho", jersey_number: 20, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 3, name: "Jordan Staal", jersey_number: 11, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 3, name: "Brent Burns", jersey_number: 8, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 4, name: "Justin Bailey", jersey_number: 90, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 4, name: "Ryan Carpenter", jersey_number: 22, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 4, name: "Logan Couture", jersey_number: 39, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 5, name: "Connor Bedard", jersey_number: 98, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 5, name: "Tyler Johnson", jersey_number: 90, won_cup: true)
    sleep(0.5)
    print "."

    Player.create!(team_id: 5, name: "Nick Foligno", jersey_number: 17, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 6, name: "Leo Carlsson", jersey_number: 91, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 6, name: "Trevor Zegras", jersey_number: 11, won_cup: false)
    sleep(0.5)
    print "."

    Player.create!(team_id: 6, name: "Radko Gudas", jersey_number: 7, won_cup: false)
    sleep(0.5)
    print "."

puts " "

puts "Seeded Successfully."