require 'rails_helper'

RSpec.describe Team, type: :model do

    it {should have_many :players}

    describe 'team has attributes' do
        it 'team exists' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            expect(test_team).to be_a (Team)
        end

        it 'team has a name' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            expect(test_team.name).to eq ("Colorado Avalanche")
        end

        it 'team has a number of season wins' do
            test_team = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            
            expect(test_team.season_wins).to eq (44)
        end

        it 'team is playoff eligible or not' do
            test_team_1 = Team.create!(name: "Colorado Avalanche", season_wins: 44, playoff_eligible: true)
            test_team_2 = Team.create!(name: "San Jose Sharks", season_wins: 16, playoff_eligible: false)

            expect(test_team_1.playoff_eligible).to eq (true)
            expect(test_team_2.playoff_eligible).to eq (false)
        end 
    end

end