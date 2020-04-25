
class CreateUserPostJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_posts, :id => false do |t|
      t.integer :user_id
      t.integer :post_id
    end
  end
end