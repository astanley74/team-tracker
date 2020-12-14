class Team < ActiveRecord::Base
    has_many :players
    belongs_to :user
    belongs_to :league
end