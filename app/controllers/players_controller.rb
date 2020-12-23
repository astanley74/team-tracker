class PlayersController < ApplicationController

    def new
        @player = Player.new
        @team = Team.find(params[:team_id])
    end

    def create
        binding.pry
        @team = Team.find(player_params[:team_id])
        @player = Player.new(player_params)
        if @player.save
            redirect_to team_player_path(@team, @player)
        else
            redirect_to new_team_player_path
        end
    end

    def show
        @player = Player.find(params[:id])
        @team = Team.find(params[:team_id])
    end

    def edit
        @team = Team.find(params[:team_id])
        @player = Player.find(params[:id])
    end

    def update
        @team = Team.find(player_params[:team_id])
        @player = Player.find(params[:id])
        @player.update(player_params)
        redirect_to team_player_path(@team, @player)
    end

    def destroy
        Player.find(params[:id]).destroy
        @team = Team.find(params[:team_id])
        redirect_to user_team_path(current_user, @team)
    end


    private
        def player_params
            params.require(:player).permit(:name, :number, :hometown, :team_id)
        end
end