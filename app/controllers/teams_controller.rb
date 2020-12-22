class TeamsController < ApplicationController
    def new
        @team = Team.new
        @user = User.find_by_id(session[:user_id])
    end

    def create
        @user = User.find_by_id(session[:user_id])
        @team = Team.new(team_params)

        if @team.save
            binding.pry
            redirect_to user_team_path(@user, @team)
        else
            render :new
        end
    end

    private
        def team_params
            params.require(:team).permit(:city, :name, :coach, :user_id, :league_id)
        end

end