class TeamsController < ApplicationController
    before_action :verified_user
    before_action :users_team, only: [:new, :edit, :destroy]

    def new
        @team = current_user.teams.build
    end

    def create
        @team = current_user.teams.create(team_params)

        if @team.save
            redirect_to user_team_path(current_user, @team)
        else
            render :new
        end
    end

    def show
        @team = find_team
    end

    def edit
        @team = find_team
    end

    def update
        @team = find_team
        if @team.update(team_params)
            redirect_to user_team_path(current_user, @team)
        else
            render :edit
        end
    end

    def destroy
        @team = find_team
        @team.destroy
        redirect_to user_path(current_user)
    end

    private
        def team_params
            params.require(:team).permit(:city, :name, :coach, :user_id, :league_id, players_attributes: [:name, :number, :hometown, :team_id])
        end

        def users_team
            unless current_user == find_team.user
                redirect_to user_path(current_user)
                flash[:error] = "Only the owner can add, edit, or delete a team!"
            end
        end

        def find_team
            Team.find(params[:id])
        end
end