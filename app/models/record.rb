class Record < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :post, optional: true 
    belongs_to :genre, optional: true
    belongs_to :artist, optional: true
    has_one_attached :image

    def post_ids=(ids)
        ids.each do |id|
        post = post.find(id)
          self.posts << post
        end
      end
end
