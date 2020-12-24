class PlayersController < ApplicationController
    before_action :verified_user


    def new
        @player = Player.new(team_id: params[:team_id])
    end

    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to team_player_path(@player.team, @player)
        else
            render :new
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
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to team_player_path(@player.team, @player)
        else
            flash[:error] = @player.errors.full_messages
            redirect_to edit_team_player_path(@team, @player)
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
end