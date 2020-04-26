class Post < ApplicationRecord
  validates_associated :user        #changesongenre
   validates_associated :record
  # validates :genre, presence: true
   #validates_associated :genre
   validates_associated :comments
  belongs_to :user, optional: true
   # has_one :genre 
    has_one :record
    has_many :comments
   # has_many :genres, inverse_of: :post
    has_many :users, through: :comments
    accepts_nested_attributes_for :record, :genres#, :record #genre plural
    has_one_attached :image
    #has_many :user_posts
   # has_many :users, through: :user_posts
   has_many :post_genres
   has_many :genres, through: :post_genres

      
  def categories_attributes=(category_attribute)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)   ##??
      self.post_categories.build(category: category)
    end
  end

  
  def genre_ids=(ids)
    ids.each do |id|
    genre = Genre.find(id)
      self.genres << genre  ##?
     end
  end

       def user_ids=(ids)
       ids.each do |id|
       user = User.find(id)
         self.users << user
        end
     end
 
end
