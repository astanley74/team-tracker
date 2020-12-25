class PlayersController < ApplicationController
    before_action :verified_user
    before_action :current_team_player, only: [:show, :edit]
    before_action :authenticate_team, only: [:new, :edit, :update]


    def new
        @player = current_team.players.build
    end

    def create
        if @player = Player.create(player_params)
            redirect_to team_player_path(@player.team, @player)
        else
            render :new
        end
    end

    def show
    end

    def edit

    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to team_player_path(@player.team, @player)
        else
            render :edit
        end
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

        def current_team
            @team = Team.find(params[:team_id])
        end

        def current_team_player
            @player = Player.find(params[:id])
            @team = Team.find(params[:team_id])
        end

        def authenticate_team
            redirect_to user_path(current_user) unless current_user.id == current_team.user_id
        end
end