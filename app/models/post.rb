class Post < ApplicationRecord
  validates_associated :user
  validates_associated :record
  validates_associated :genres
  validates_associated :artist
    belongs_to :user
    has_many :post_genres
    has_many :genres, through: :post_genres
    belongs_to :artist
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record, :genres, :artist
    has_one_attached :image
    has_many :post_categories
    has_many :categories, through: :post_categories
    
    def self.by_artist(artist_id)
      where(artist: artist_id)
    end
    
      def user_ids=(ids)
       ids.each do |id|
       user = User.find(id)
         self.users << user
        end
     end
 
end
