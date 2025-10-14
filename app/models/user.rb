class User < ApplicationRecord
    has_secure_token :token, length: 50
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: :password_present?
    validates :password_confirmation, length: { minimum: 6 }, if: :password_present?
    has_secure_password # This adds methods to set and authenticate against a BCrypt password.
    has_many :articles
    has_many :comments
    has_one :profile

    private

    def password_present?
        false || password.present?
    end
end
