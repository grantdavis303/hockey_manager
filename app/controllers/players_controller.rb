class PlayersController < ApplicationController
    def index
        @players = Player.all
    end

    def show
        @player = Player.find(params[:id])
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

    def destroy
        Player.destroy(params[:id])

        redirect_to "/players"
    end  
end