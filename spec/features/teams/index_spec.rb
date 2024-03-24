require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
    
    # User Story 1   
    describe 'teams index lists all teams' do 
        it 'lists all teams' do
            team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team_2 = Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
            team_3 = Team.create!(name: "Carolina Hurricanes", season_wins: 43, playoff_eligible: true)
            
            visit '/teams'
            
            expect(page).to have_content(team_1.name)
            expect(page).to have_content(team_2.name)
            expect(page).to have_content(team_3.name)
        end

        # User Story 6
        it 'teams index lists all teams in descending creation first' do
            team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team_2 = Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
            team_3 = Team.create!(name: "Carolina Hurricanes", season_wins: 43, playoff_eligible: true)
            
            visit '/teams'
            
            expect(team_3.name).to appear_before(team_2.name)
            expect(team_2.name).to appear_before(team_1.name)
        end
    end

    # User Story 8
    describe 'all pages have link to teams index' do
        it 'all pages have link to teams index' do
            visit '/'

            expect(page).to have_link(href: "/teams")
            
            visit '/players'

            expect(page).to have_link(href: "/teams")
            
            visit '/teams'

            expect(page).to have_link(href: "/players")
        end
    end

end