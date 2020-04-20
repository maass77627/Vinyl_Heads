class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.integer :user_id
      t.integer :post_id
      t.integer :genre_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
