class User < ApplicationRecord
    has_many :teams
    has_many :leagues, through: :teams
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
    validates :password, length: {minimum: 5}

    def self.find_or_create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.email = auth['info']['email']
            u.name = auth['info']['name']
            u.password = SecureRandom.hex(16)
        end
    end
end