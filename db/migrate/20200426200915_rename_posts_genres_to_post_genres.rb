class RenamePostsGenresToPostGenres < ActiveRecord::Migration[6.0]
  def change
    rename_table :posts_genres, :post_genres 
  end
end
