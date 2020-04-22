class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
   
    has_many :comments
    has_many :records
    has_many :posts
    has_secure_password
end
