class Genre < ApplicationRecord
    has_many :records
    has_many :artists
    #has_many :posts, inverse_of: :genre
    has_many :post_genres
   has_many :posts, through: :post_genres
    
   
   def post_ids=(ids)
        ids.each do |id|
          post = Post.find(id)
          self.posts << post
        end
      end
end
