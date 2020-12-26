class Player < ActiveRecord::Base
    belongs_to :team
    validates_presence_of :name, :number, :hometown
    validates :name, uniqueness: true
    validates :number, uniqueness: {scope: :team_id}

    def self.order_by_number
        order(number: :asc)
    end
end