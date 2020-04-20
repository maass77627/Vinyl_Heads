class User < ApplicationRecord
    has_many :comments
    has_many :records
    has_many :posts
    has_secure_password
end
