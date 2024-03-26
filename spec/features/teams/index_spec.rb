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

    # User Story 9
    describe 'all pages have link to teams index' do
        it 'all pages have link to teams index' do
            visit '/'

            expect(page).to have_link(href: "/teams")
            
            visit '/players'

            expect(page).to have_link(href: "/teams")
            
            visit '/teams'

            expect(page).to have_link(href: "/players")
        end

        # User Story 11
        it 'new teams can be created' do
            visit '/teams'
            click_button "New Team"
                   
            expect(current_path).to eq("/teams/new")

            fill_in 'title', with: 'Las Vegas Golden Knights'
            fill_in 'wins', with: 38
            choose "yes"
            click_button "Create Team"

            # binding.pry
            # save_and_open_page

            expect(current_path).to eq("/teams")
            expect(page).to have_content("Las Vegas Golden Knights")

        end

        # User Story 12
        it 'current teams can be updated' do
            Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)

            visit '/teams'
            click_link "Colorado Avalanche"
            click_button "Update Team"
            fill_in 'title', with: 'San Jose Sharks'
            fill_in 'wins', with: 16
            choose "no"
            click_button "Update Team"

            expect(page).to have_content("San Jose Sharks")
            expect(page).to have_content("16")
            expect(page).to have_content("Unfortunately not this year.")
        end

    end

end