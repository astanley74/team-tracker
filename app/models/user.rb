class User < ActiveRecord::Base
    has_many :teams
    has_many :leagues, through: :teams
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
    validates :password, length: {minimum: 5}
end