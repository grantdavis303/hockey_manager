require 'rails_helper'

RSpec.describe "teams index page", type: :feature do
    
    # User Story 1   
    it 'teams index page lists all teams' do
        team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team_2 = Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
        team_3 = Team.create!(name: "Carolina Hurricanes", season_wins: 43, playoff_eligible: true)
        
        visit '/teams'
        
        expect(page).to have_content(team_1.name)
        expect(page).to have_content(team_1.created_at)
        expect(page).to have_content(team_2.name)
        expect(page).to have_content(team_2.created_at)
        expect(page).to have_content(team_3.name)
        expect(page).to have_content(team_3.created_at)
    end

    # User Story 6
    it 'teams index page lists all teams in descending creation first' do
        team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team_2 = Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
        team_3 = Team.create!(name: "Carolina Hurricanes", season_wins: 43, playoff_eligible: true)
        
        visit '/teams'
        
        expect(team_3.name).to appear_before(team_2.name)
        expect(team_2.name).to appear_before(team_1.name)
    end

    # User Story 9
    it 'all pages have link to teams index page' do
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

        fill_in 'team_name', with: 'Las Vegas Golden Knights'
        fill_in 'season_wins', with: 38
        choose "yes"
        click_button "Create Team"

        expect(current_path).to eq("/teams")
        expect(page).to have_content("Las Vegas Golden Knights")

    end

    # User Story 12
    it 'current teams can be updated' do
        Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)

        visit '/teams'
        click_link "Colorado Avalanche"
        click_button "Update Team"
        fill_in 'team_name', with: 'San Jose Sharks'
        fill_in 'season_wins', with: 16
        choose "no"
        click_button "Update Team"

        expect(page).to have_content("San Jose Sharks")
        expect(page).to have_content("16")
        expect(page).to have_content("Unfortunately not.")
    end

    # User Story 17
    it 'teams index page has update teams links next to each team' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)

        visit '/teams'

        expect(page).to have_button("Update Team")

        click_button "Update Team"

        expect(current_path).to eq("/teams/#{team.id}/edit")
    end

    # User Story 19
    it 'current teams can be destroyed from the show page' do
        Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)

        visit '/teams'
        click_link "Colorado Avalanche"
        click_button "Delete Team"

        expect(current_path).not_to have_content("Colorado Avalanche")
    end

    # User Story 22
    it 'current teams can be destroyed from the index page' do
        Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)

        visit '/teams'
        click_button "Delete Team"

        expect(current_path).not_to have_content("Colorado Avalanche")
    end

end