class Post < ApplicationRecord
    belongs_to :user, optional: true
    has_one :record
    has_many :comments
    has_many :users, through: :comments
    accepts_nested_attributes_for :record




    def user_ids=(ids)
        ids.each do |id|
        user = User.find(id)
          self.users << user
        end
      end
 
end
