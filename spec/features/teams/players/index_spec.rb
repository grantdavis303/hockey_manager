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
    end

end