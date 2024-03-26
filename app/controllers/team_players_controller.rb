class TeamPlayersController < ApplicationController
    def index
        @team = Team.find(params[:id])
        @players = @team.players.order(name: :asc)
    end

    def new
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update
        player = Player.find(params[:id])

        player.update({
            name: params[:player_name],
            jersey_number: params[:jersey_number],
            won_cup: params[:won_cup]
        })

        player.save
        redirect_to "/players/#{player.id}"
    end

    def create
        player = Player.new({
            name: params[:player_name],
            jersey_number: params[:jersey_number],
            won_cup: check_bool(params[:won_cup])
        })

        player.save
        redirect_to "/players"
    end

    def check_bool(form_response)
        form_response == "true"
    end

end