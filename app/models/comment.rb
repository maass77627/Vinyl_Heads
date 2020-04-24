class Comment < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post
    validates :message, presence: true, allow_blank: false

    def post_ids=(ids)
      ids.each do |id|
      post = Post.find(id)
        self.posts << post
      end
    end

end
