require 'rails_helper'

RSpec.describe "players show page", type: :feature do

    # User Story 4
    describe 'includes all player attributes' do
        it 'includes content for individual player' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            
            visit "/players/#{team.players[0].id}"
            
            expect(page).to have_content(team.players[0].name)
        end

        it 'includes the player jersey number' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            
            visit "/players/#{team.players[0].id}"
            
            expect(page).to have_content(team.players[0].jersey_number)
        end

        it 'includes if the player has won a Stanley Cup or not' do
            team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            
            visit "/players/#{team.players[0].id}"
            
            expect(page).to have_content("Has previously won a Stanley Cup? Yes!")
        end        
    end

    # User Story 14
    it 'player show page has update player button' do
        team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
        team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)

        visit "/players/#{team.players[0].id}"

        expect(page).to have_button("Update Player")

        click_button "Update Player"
        fill_in 'player_name', with: 'Grant Davis'
        fill_in 'jersey_number', with: "0"
        choose "no"
        click_button "Update Player"

        expect(page).to have_content("Grant Davis")
        expect(page).to have_content("Jersey Number: 0")
        expect(page).to have_content("Has previously won a Stanley Cup? Unfortunately not.")
        expect(current_path).to eq("/players/#{team.players[0].id}")
    end

end