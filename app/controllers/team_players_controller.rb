class TeamPlayersController < ApplicationController
    def index
        @team = Team.find(params[:id])
        @players = @team.players.order(name: :asc)
    end
end