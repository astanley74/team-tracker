class PlayersController < ApplicationController

    private
        def player_params
            params.require(:player).permit(:name, :hometown, :team_id)
        end
end