require 'rails_helper'

RSpec.describe "players index page", type: :feature do

    # User Story 3
    it 'players index lists all players' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
        team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
        team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)

        visit '/players'
        
        expect(page).to have_content(team.players[0].name)
        expect(page).to have_content(team.players[1].name)
        #expect(page).to have_content(team.players[2].name)
    end        

    # User Story 8
    it 'all pages have link to players index' do
        visit '/'

        expect(page).to have_link(href: "/players")
        
        visit '/players'

        expect(page).to have_link(href: "/players")
        
        visit '/teams'

        expect(page).to have_link(href: "/players")
    end

    # User Story 18 P1
    it 'current players can be updated in the players index page' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
        team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
        team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)

        visit '/players'
        click_button "Update Nathan MacKinnon"
        fill_in "player_name", with: "Grant Davis" 
        fill_in "jersey_number", with: "17"
        choose "no"        
        click_button "Update Player"

        expect(page).to have_content("Grant Davis")
    end

    # User Story 18 P2
    it 'current players can be updated in the players index page' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
        team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
        team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)

        visit "/teams/#{team.id}/players"

        click_button "Update Nathan MacKinnon"
        fill_in "player_name", with: "Grant Davis" 
        fill_in "jersey_number", with: "17"
        choose "no"        
        click_button "Update Player"

        expect(page).to have_content("Grant Davis")
    end

    # User Story 20
    it 'current players can be destroyed' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
        team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
        team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)

        visit '/players'
        click_link "Nathan MacKinnon"
        click_button "Delete Player"

        expect(current_path).not_to have_content("Nathan MacKinnon")
    end

end