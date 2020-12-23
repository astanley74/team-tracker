class Player < ActiveRecord::Base
    belongs_to :team
    validates_presence_of :name, :number, :hometown
    validates :name, uniqueness: true
end