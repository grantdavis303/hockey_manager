class PlayersController < ApplicationController
    def index
        @players = Player.all
    end

    def show
        @player = Player.find(params[:id])
    end

    # def edit
    #     @player = Player.find(params[:id])
    # end

    def destroy
        Player.destroy(params[:id])

        redirect_to "/players"
    end

end