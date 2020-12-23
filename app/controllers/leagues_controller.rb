class LeaguesController < ApplicationController
    before_action :verified_user

    def index
        @leagues = League.all
    end
    
    def show
        @league = League.find(params[:id])
    end
end