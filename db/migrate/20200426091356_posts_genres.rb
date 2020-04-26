class PostsGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_genres, :id => false do |t|
      t.integer :post_id
      t.integer :genre_id
  end
end
end 