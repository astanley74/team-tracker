class PlayersController < ApplicationController

    def new
        @player = Player.new
    end

    def create
    end

    private
        def player_params
            params.require(:player).permit(:name, :hometown, :team_id)
        end
end