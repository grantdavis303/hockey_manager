require 'rails_helper'

RSpec.describe "teams players index page", type: :feature do

    # User Story 5
    describe 'teams players index lists all teams' do 
        it 'lists all teams players' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
            team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)
            
            visit "/teams/#{team.id}/players"
            
            expect(page).to have_content(team.players[0].name)
            expect(page).to have_content(team.players[1].name)
            expect(page).to have_content(team.players[2].name)
        end

        it 'lists all teams players in alphabetical order' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
            team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)
            
            visit "/teams/#{team.id}/players"
            
            expect(team.players[2].name).to appear_before(team.players[1].name)
            expect(team.players[1].name).to appear_before(team.players[0].name)
        end
    end

    # User Story 13
    describe 'has additional features' do
        it 'new players can be created' do
            Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            visit '/teams'
            click_link "Colorado Avalanche"
            click_button "Colorado Avalanche Players"
            click_button "New Player"
            fill_in "player_name", with: "Grant Davis" 
            fill_in "jersey_number", with: "17"
            choose "no"
            click_button "Create Player"

            expect(page).to have_content("Grant Davis")
            expect(page).to have_content("17")
            expect(page).to have_content("Unfortunately not.")
        end
    end

end