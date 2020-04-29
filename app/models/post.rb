class Post < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :genre 
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record, :genre
    has_one_attached :image
    belongs_to :artist

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
