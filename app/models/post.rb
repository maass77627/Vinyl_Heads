class Post < ApplicationRecord
    belongs_to :user
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record
    has_one_attached :image
    has_many :user_posts
    has_many :users, through: :user_posts




       def user_ids=(ids)
       ids.each do |id|
       user = User.find(id)
         self.users << user
        end
     end
 
end
