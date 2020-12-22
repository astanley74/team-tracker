class TeamsController < ApplicationController
    def new
        @team = Team.new
    end

    private
        def team_params
            params.require(:team).permit(:city, :name, :coach, :user_id, :league_id)
        end

end