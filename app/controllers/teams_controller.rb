class TeamsController < ApplicationController
    before_action :verified_user
    before_action :users_team, only: [:new, :edit, :update]

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
        @team = User.find(params[:user_id]).teams.find(params[:id])
    end

    def edit
        if current_user != Team.find(params[:id]).user
            redirect_to(current_user)
            flash[:error] = "You must be the owner of the team to edit!"
        else
            @team = User.find(params[:user_id]).teams.find(params[:id])
        end
    end

    def update
        if @team.update(team_params)
            redirect_to user_team_path(current_user, @team)
        else
            render :edit
        end
    end

    def destroy
        if current_user == Team.find(params[:id]).user
            Team.find(params[:id]).destroy
            redirect_to user_path(current_user)
        else
            redirect_to user_path(current_user)
            flash[:error] = "You must be the owner of the team to edit or delete"
        end
    end

    private
        def team_params
            params.require(:team).permit(:city, :name, :coach, :user_id, :league_id, players_attributes: [:name, :number, :hometown, :team_id])
        end

        def users_team
            redirect_to user_path(current_user) unless current_user == User.find(params[:user_id])
        end

end