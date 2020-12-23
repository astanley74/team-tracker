class TeamsController < ApplicationController
    def new
        @team = Team.new(user_id: params[:user_id])
    end

    def create
        @team = Team.new(team_params)

        if @team.save
            # binding.pry
            redirect_to user_team_path(current_user, @team)
        else
            flash[:error] = @team.errors.full_messages
            redirect_to new_user_team_path(current_user)
        end
    end

    def show
        @team = User.find(params[:user_id]).teams.find(params[:id])
    end

    def edit
        @user = User.find(params[:user_id])
        @team = @user.teams.find(params[:id])
    end

    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to user_team_path(current_user, @team)
        else
            flash[:error] = @team.errors.full_messages
            redirect_to edit_user_team_path(current_user, @team)
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