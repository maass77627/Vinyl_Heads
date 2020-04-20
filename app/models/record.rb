class Record < ApplicationRecord
    belongs_to :user
    belongs_to :post
    belongs_to :genre
    belongs_to :artist
end
