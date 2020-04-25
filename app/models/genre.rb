class Genre < ApplicationRecord
    has_many :records
    has_many :artists
    has_many :posts

    def post_ids=(ids)
        ids.each do |id|
          post = Post.find(id)
          self.posts << post
        end
      end
end
