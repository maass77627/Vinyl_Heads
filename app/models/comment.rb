class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :post
    validates :message, presence: true, allow_blank: false
    accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank?}

  def user_attributes(user_attributes)
    user_attributes.values.each do |user_attributes|
      if user_attributes[:username].present?
        user = User.find_or_create_by(user_attributes)
        if !self.user = user
          self.build_user(:username => user[:username])
        end
      end
    end
  end

    def post_ids=(ids)
      ids.each do |id|
      post = Post.find(id)
        self.posts << post
      end
    end

end
