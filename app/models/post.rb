class Post < ApplicationRecord
  #has_many :user_posts
   # has_many :users, through: :user_posts
   #has_many :post_genres
   #has_many :genres, through: :post_genres
   # has_many :genres, inverse_of: :post
  #validates :id, presence: true
 # validates_associated :user        #changesongenre
  # validates_associated :record
  # validates_associated :record
  # validates :genre, presence: true
   #validates_associated :genre
  # validates_associated :comments
  belongs_to :user, optional: true
    belongs_to :genre 
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record, :genre#, :artist
    has_one_attached :image
    belongs_to :artist

    def self.by_artist(artist_id)###
      where(artist: artist_id)
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
