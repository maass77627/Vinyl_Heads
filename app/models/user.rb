class User < ApplicationRecord
   # validates :id, presence: true
   # devise :omniauthable, :omniauth_providers => [:facebook]
    validates :username, :email, presence: true
    #validates :email, :username, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates :username, format: { without: /[0-9]/, message: "does not allow numbers" }
   # has_many :genres
    has_many :comments
    has_many :posts, through: :comments
    has_many :records
    has_many :posts
   # has_many :user_posts
   # has_many :posts, through: :user_posts
    has_secure_password
end
