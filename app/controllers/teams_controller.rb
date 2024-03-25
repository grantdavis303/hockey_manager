class TeamsController < ApplicationController
    def index
        @teams = Team.all.order(created_at: :desc)
    end

    def new
    end

    def show
        @team = Team.find(params[:id])
    end

    def edit
        @team = Team.find(params[:id])
    end

    def update
        team = Team.find(params[:id])
        team.update({
            name: params[:title],
            season_wins: params[:wins],
            playoff_eligible: params[:playoff_eligible]
        })

        team.save
        redirect_to "/teams/#{team.id}"
    end

    def create        
        team = Team.new({
            name: params[:title],
            season_wins: params[:wins].to_i,
            playoff_eligible: check_bool(params[:playoff_eligible])
        })

        team.save
        redirect_to "/teams"
    end

    def check_bool(form_response)
        form_response == "true"
    end

end