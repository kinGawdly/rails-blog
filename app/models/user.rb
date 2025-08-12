class User < ApplicationRecord
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true 
    has_secure_password # This adds methods to set and authenticate against a BCrypt password.
    has_many :articles
end
