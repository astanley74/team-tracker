class Team < ActiveRecord::Base
    has_many :players
    belongs_to :user
    belongs_to :league

    validates_presence_of :city, :name, :coach
    validates :name, :coach, uniqueness: true
end