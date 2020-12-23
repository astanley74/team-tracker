class PlayersController < ApplicationController

    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to team_player_path(@player)
        else
            redirect_to new_team_player_path
        end
    end



    private
        def player_params
            params.require(:player).permit(:name, :number, :hometown, :team_id)
        end
end