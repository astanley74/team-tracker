class PlayersController < ApplicationController

    def new
        @player = Player.new
        @team = Team.find(params[:team_id])
    end

    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to team_player_path(@player)
        else
            redirect_to new_team_player_path
        end
    end

    def show
        @player = Player.find(params[:id])
    end



    private
        def player_params
            params.require(:player).permit(:name, :number, :hometown, :team_id)
        end
end