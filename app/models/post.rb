class Post < ApplicationRecord
    belongs_to :user
    has_many :records
    has_many :comments
    accepts_nested_attributes_for :records
end
