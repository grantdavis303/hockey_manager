class TeamPlayersController < ApplicationController
    def index
        @team = Team.find(params[:id])
        
        if params[:sort] == "true"
            @players = @team.players.order(name: :asc)
        else
            @players = @team.players
        end
    end

    def new
        @team = Team.find(params[:id])
    end

    def create
        player = Player.new({
            name: params[:player_name],
            team_id: params[:team_id].to_i,
            jersey_number: params[:jersey_number],
            won_cup: check_bool(params[:won_cup])
        })
        
        player.save
        redirect_to "/teams/#{player.team_id}/players"
    end

    def check_bool(form_response)
        form_response == "true"
    end
end