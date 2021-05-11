class Team < ApplicationRecord
    has_many :players, dependent: :destroy
    belongs_to :user
    belongs_to :league

    validates_presence_of :city, :name, :coach
    validates :city, uniqueness: {scope: :league_id}
    validates :name, :coach, uniqueness: true

    accepts_nested_attributes_for :players, reject_if: proc {|attr| attr["name"].blank?}

    def self.order_by_name
        order(name: :desc)
    end

    def self.same_city
        where(city: "San Jose")
    end

    # scope :order_by_name, -> { order(name: :desc) }
end