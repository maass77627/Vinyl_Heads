class Post < ApplicationRecord
  validates_associated :user
  validates_associated :record
  validates_associated :genres #######
  validates_associated :artist
    belongs_to :user#, optional: true
    has_many :post_genres   ###
    has_many :genres, through: :post_genres ####
    belongs_to :artist
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record, :genres, :artist #####
    has_one_attached :image
    has_many :post_categories
    has_many :categories, through: :post_categories

   # has_many :users_posts
   # has_many :users, through :users_posts
    

    def self.by_genre(genre_id)
      where(genre: genre_id)
    end
  
    def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
    end
  
    def genre_name
       self.genre ? self.genre.name : nil
    end

    def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
    end
  
    def artist_name
       self.artist ? self.artist.name : nil
    end
    

       def user_ids=(ids)
       ids.each do |id|
       user = User.find(id)
         self.users << user
        end
     end
 
end
