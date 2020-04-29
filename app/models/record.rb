class Record < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true
    belongs_to :genre, optional: true
    belongs_to :artist, optional: true
end
