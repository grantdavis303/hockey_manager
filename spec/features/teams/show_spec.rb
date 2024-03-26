require 'rails_helper'

RSpec.describe "teams show page", type: :feature do

    # User Story 2
    describe 'includes all team attributes' do
        it 'includes the team name' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            visit "/teams/#{team.id}"
            
            expect(page).to have_content(team.name)
        end

        it 'includes the team season number of wins ' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            visit "/teams/#{team.id}"
            
            expect(page).to have_content(team.season_wins)
        end

        it 'includes if the team is playoff eligible or not' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            visit "/teams/#{team.id}"
            
            expect(page).to have_content("Yes!")
        end        
    end

    # User Story 7
    describe 'includes additional team information' do
        it 'includes team current player count' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
            team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)
            
            visit "/teams/#{team.id}"

            expect(page).to have_content("Current Player Count: #{team.players.count}")
        end

        # User Story 10
        it 'includes team current player count' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            team.players.create!(name: "Mikko Rantanen", jersey_number: 96, won_cup: true)
            team.players.create!(name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)
            
            visit "/teams/#{team.id}"

            expect(page).to have_button("Colorado Avalanche Players")
        end  
    end

end