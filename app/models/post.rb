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
    accepts_nested_attributes_for :record, :genre
    has_one_attached :image

      
 # def genre_attributes=(genre_attribute)
   # genre_attributes.values.each do |genre_attribute|
    #  genre = Genre.find_or_create_by(genre_attribute)
    #  self.post_genres.build(genre: genre)
   # end
 # end

  
  def genre_ids=(ids)
    ids.each do |id|
   genre = Genre.find_or_create_by(id)
      self.genres << genre
     end
end 

       def user_ids=(ids)
       ids.each do |id|
       user = User.find(id)
         self.users << user
        end
     end
 
end
