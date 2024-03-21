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
            
            expect(page).to have_content("Yes!" || "Unfortunately not this year.")
        end        
    end

end