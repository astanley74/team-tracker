module PlayersHelper

    def current_team
        @team = Team.find(params[:team_id])
    end


end