class TeamsController < ApplicationController
    before_action :verified_user

    def new
        if current_user == User.find(params[:user_id])
            @team = current_user.teams.build
        else
            redirect_to user_path(current_user)
            flash[:error] = "You must be the correct user to add a team"
        end
    end

    def create
        @team = current_user.teams.build(team_params)

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
        @team = current_user.teams.find(params[:id])
    end

    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to user_team_path(current_user, @team)
        else
            render :edit
        end
    end

    def destroy
        Team.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private
        def team_params
            params.require(:team).permit(:city, :name, :coach, :user_id, :league_id)
        end

end