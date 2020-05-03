class RenameCategoriesPostsToPostCategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories_posts, :post_categories
  end
end
