class Team < ActiveRecord::Base
    has_many :players
    belongs_to :user
    belongs_to :league

    validates_presence_of :city, :name, :coach
    validates :city, uniqueness: {scope: :league_id}
    validates :name, :coach, uniqueness: true

    accepts_nested_attributes_for :players

    # def self.order_by_name
    #     order(name: :desc)
    # end

    scope :order_by_name, -> { order(name: :desc) }
end