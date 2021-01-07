class PlayersController < ApplicationController
    before_action :verified_user
    before_action :authenticate_team, only: [:new, :edit, :destroy]


    def new
        @player = current_team.players.build
    end

    def create
        @player = Player.create(player_params)

        if @player.save
            redirect_to team_player_path(@player.team, @player)
        else
            render :new
        end
    end

    def show
        @player = find_player
    end

    def edit
        @player = find_player
    end

    def update
        @player = find_player
        if @player.update(player_params)
            redirect_to team_player_path(@player.team, @player)
        else
            render :edit
        end
    end

    def destroy
        find_player.destroy
        @team = current_team
        redirect_to user_team_path(current_user, @team)
    end


    private
        def player_params
            params.require(:player).permit(:name, :number, :hometown, :team_id)
        end

        def current_team
            Team.find(params[:team_id])
        end

        def find_player
            Player.find(params[:id])
        end

        def authenticate_team
            unless current_user.id == current_team.user_id
                redirect_to user_path(current_user) 
                flash[:error] = "Only the owner can add, edit, or delete players from a team!"
            end
        end
end