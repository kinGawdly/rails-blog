class User < ApplicationRecord
    has_secure_password # This adds methods to set and authenticate against a BCrypt password.
end
