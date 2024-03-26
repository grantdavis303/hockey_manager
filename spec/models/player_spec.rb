require 'rails_helper'

RSpec.describe Player, type: :model do

    it {should belong_to :team}

    describe 'player has attributes' do
        it 'player exists' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            test_team.players.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)

            expect(test_team.players[0]).to be_a (Player)
        end

        it 'player has a name' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            test_team.players.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)

            expect(test_team.players[0].name).to eq ("Nathan MacKinnon")
        end

        it 'player has a jersey number' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            test_team.players.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)

            expect(test_team.players[0].jersey_number).to eq (29)
        end

        it 'player has won a Stanley Cup or not' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            test_team.players.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)
            test_team.players.create!(team_id: 1, name: "Casey Mittelstadt", jersey_number: 37, won_cup: false)

            expect(test_team.players[0].won_cup).to eq (true)
            expect(test_team.players[1].won_cup).to eq (false)
        end 
    end

    describe 'additional player methods' do
        it '#is_a_champion' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            player = test_team.players.create!(team_id: 1, name: "Nathan MacKinnon", jersey_number: 29, won_cup: true)          

            returned_value = player.is_a_champion(player.won_cup)

            expect(returned_value).to eq ("Yes!")
        end
    end
end