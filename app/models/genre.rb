class Genre < ApplicationRecord
    has_many :records
    has_many :artists
    has_many :posts
end
