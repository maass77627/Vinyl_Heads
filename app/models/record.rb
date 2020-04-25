class Record < ApplicationRecord
    belongs_to :user#, optional: true 
    belongs_to :post#, optional: true 
    belongs_to :genre, optional: true
    belongs_to :artist, optional: true
    has_one_attached :image
    accepts_nested_attributes_for :genre, :post

    def post_ids=(ids)
        ids.each do |id|
        post = post.find(id)
          self.posts << post
        end
      end

      def self.search(search)
        if search 
            genre = Genre.find_by(name: search)
            if genre 
                self.where(genre_id: genre)
            else 
                Record.all
            end
        else
            Record.all
        end 
    end 
end
