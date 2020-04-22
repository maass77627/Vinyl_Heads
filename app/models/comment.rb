class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post


    def comment_ids=(ids)
        ids.each do |id|
        comment = comment.find(id)
          self.comments << comment
        end
      end
end
