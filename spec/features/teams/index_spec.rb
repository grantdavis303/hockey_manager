require 'rails_helper'

RSpec.describe "teams index page", type: :feature do

    it 'lists all teams' do
        team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team_2 = Team.create!(name: "Boston Bruins", season_wins: 41, playoff_eligible: true)
        team_3 = Team.create!(name: "Carolina Hurricanes", season_wins: 43, playoff_eligible: true)

        visit '/teams'
        save_and_open_page
        
        expect(page).to have_content(team_1.name)
        expect(page).to have_content(team_2.name)
        expect(page).to have_content(team_3.name)
    end

end